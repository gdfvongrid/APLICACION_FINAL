import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gd_fv_app/features/billing/billing_tariffs.dart';
import 'package:gd_fv_app/features/billing/billing_model.dart';
import 'package:gd_fv_app/features/billing/tariff_blocks.dart';

import 'tariff_cloud_config.dart';

class TariffBundle {
  final String version;
  final Map<Distributor, Map<String, BlockTariff>> catalog;

  TariffBundle({required this.version, required this.catalog});
}

class TariffRepository {
  static const _prefsKeyVersion = 'tariffs.version';
  static const _prefsKeyJson = 'tariffs.json';

  Future<TariffBundle> loadTariffs() async {
    // 1) intentar nube
    final cloud = await _tryLoadFromCloud();
    if (cloud != null) return cloud;

    // 2) fallback: cache local (si existe)
    final cached = await _tryLoadFromCache();
    if (cached != null) return cached;

    // 3) fallback final: hardcode del proyecto
    return TariffBundle(version: 'embedded', catalog: tariffCatalog);
  }

  Future<TariffBundle?> _tryLoadFromCloud() async {
    try {
      final manifestRes = await http
          .get(Uri.parse(TariffCloudConfig.manifestUrl))
          .timeout(Duration(seconds: TariffCloudConfig.timeoutSeconds));

      if (manifestRes.statusCode != 200) return null;

      final manifest = jsonDecode(manifestRes.body) as Map<String, dynamic>;
      final version = (manifest['latestVersion'] ?? '') as String;
      final url = (manifest['latestUrl'] ?? '') as String;

      if (version.isEmpty || url.isEmpty) return null;

      final tariffsRes = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: TariffCloudConfig.timeoutSeconds));
      if (tariffsRes.statusCode != 200) return null;

      // parse JSON de tarifas
      final bundle = _parseTariffsJson(version, tariffsRes.body);

      // guardar cache
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKeyVersion, version);
      await prefs.setString(_prefsKeyJson, tariffsRes.body);

      return bundle;
    } catch (_) {
      return null;
    }
  }

  Future<TariffBundle?> _tryLoadFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final version = prefs.getString(_prefsKeyVersion);
      final jsonStr = prefs.getString(_prefsKeyJson);

      if (version == null || jsonStr == null) return null;
      return _parseTariffsJson(version, jsonStr);
    } catch (_) {
      return null;
    }
  }

  TariffBundle _parseTariffsJson(String version, String jsonStr) {
    final root = jsonDecode(jsonStr) as Map<String, dynamic>;

    final Map<Distributor, Map<String, BlockTariff>> catalog = {};

    final distributors = (root['distributors'] as Map<String, dynamic>?) ?? {};
    for (final entry in distributors.entries) {
      final dist = _distFromKey(entry.key);
      if (dist == null) continue;

      final categories = (entry.value as Map<String, dynamic>?) ?? {};
      final Map<String, BlockTariff> catMap = {};

      for (final cEntry in categories.entries) {
        final catName = cEntry.key;
        final cObj = (cEntry.value as Map<String, dynamic>?) ?? {};

        final fixed = (cObj['fixedChargeBs'] ?? 0).toDouble();

        final blocksJson = (cObj['blocks'] as List<dynamic>? ?? []);
        final blocks = blocksJson
            .map((b) {
              final m = b as Map<String, dynamic>;
              return EnergyBlock(
                startKwhExclusive: (m['startKwhExclusive'] ?? 0).toDouble(),
                endKwhInclusive: (m['endKwhInclusive'] == null)
                    ? null
                    : (m['endKwhInclusive'] as num).toDouble(),
                rateBsPerKwh: (m['rateBsPerKwh'] ?? 0).toDouble(),
              );
            })
            .toList(growable: false);

        catMap[catName] = BlockTariff(fixedChargeBs: fixed, blocks: blocks);
      }

      catalog[dist] = catMap;
    }

    return TariffBundle(version: version, catalog: catalog);
  }

  Distributor? _distFromKey(String key) {
    // debe coincidir con los keys del JSON
    switch (key) {
      case 'delapaz':
        return Distributor.delapaz;
      case 'endeDelbeni':
        return Distributor.endeDelbeni;
      case 'cre':
        return Distributor.cre;
      case 'cessa':
        return Distributor.cessa;
      case 'elfec':
        return Distributor.elfec;
      case 'endeDeoruro':
        return Distributor.endeDeoruro;
      default:
        return null;
    }
  }
}

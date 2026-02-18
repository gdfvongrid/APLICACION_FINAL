import 'dart:convert';
import 'package:flutter/services.dart';

class PanelItem {
  final String nombre;
  final double wp;
  final double precioBs;
  final String tipo;
  const PanelItem({
    required this.nombre,
    required this.wp,
    required this.precioBs,
    required this.tipo,
  });

  factory PanelItem.fromJson(Map<String, dynamic> j) => PanelItem(
    nombre: j['nombre'] as String,
    wp: (j['wp'] as num).toDouble(),
    precioBs: (j['precioBs'] as num).toDouble(),
    tipo: (j['tipo'] as String?) ?? '',
  );
}

class InverterItem {
  final String nombre;
  final double pacW;
  final double precioBs;
  final String tipo;
  const InverterItem({
    required this.nombre,
    required this.pacW,
    required this.precioBs,
    required this.tipo,
  });

  factory InverterItem.fromJson(Map<String, dynamic> j) => InverterItem(
    nombre: j['nombre'] as String,
    pacW: (j['pacW'] as num).toDouble(),
    precioBs: (j['precioBs'] as num).toDouble(),
    tipo: (j['tipo'] as String?) ?? '',
  );
}

class CatalogData {
  final List<PanelItem> paneles;
  final List<InverterItem> inversores;
  const CatalogData({required this.paneles, required this.inversores});
}

class CatalogRepository {
  Future<CatalogData> load() async {
    final raw = await rootBundle.loadString(
      'assets/catalog/autosolar_catalog.json',
    );
    final j = jsonDecode(raw) as Map<String, dynamic>;
    final paneles = (j['paneles'] as List)
        .map((e) => PanelItem.fromJson(e))
        .toList();
    final inversores = (j['inversores'] as List)
        .map((e) => InverterItem.fromJson(e))
        .toList();
    return CatalogData(paneles: paneles, inversores: inversores);
  }
}

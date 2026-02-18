import 'package:flutter/material.dart';

import '../billing/billing_model.dart';
import '../billing/billing_service.dart';
import '../billing/billing_tariffs.dart'; // categoriesFor + tariffCatalog
import '../catalog/catalog_repository.dart';
import '../economics/economics_model.dart';
import '../economics/economics_service.dart';
import 'distributor_cities.dart';
import 'hsp_data.dart';
import 'sizing_model.dart';
import 'sizing_service.dart';

class SizingScreen extends StatefulWidget {
  const SizingScreen({super.key});

  @override
  State<SizingScreen> createState() => _SizingScreenState();
}

class _SizingScreenState extends State<SizingScreen> {
  final _formKey = GlobalKey<FormState>();

  Distributor _dist = Distributor.elfec;
  String _cityKey = 'COCHABAMBA';

  // NUEVO: categoría para payback (usa el mismo key de billing_tariffs.dart)
  String _cat = '';

  // 6 meses
  final _m1 = TextEditingController(text: '250');
  final _m2 = TextEditingController(text: '250');
  final _m3 = TextEditingController(text: '250');
  final _m4 = TextEditingController(text: '250');
  final _m5 = TextEditingController(text: '250');
  final _m6 = TextEditingController(text: '250');

  final _offsetPct = TextEditingController(text: '70'); // %
  final _pr = TextEditingController(text: '0.80'); // PR
  final _dcac = TextEditingController(text: '1.20'); // DC/AC

  // NUEVO: OPEX anual (% del CAPEX)
  final _opexPct = TextEditingController(text: '1.0');

  MountType _mount = MountType.roof;
  PvOrientation _orientation = PvOrientation.north;

  CatalogData? _catalog;
  String? _catalogError;

  SizingResult? _result;
  EconomicsResult? _econ;

  double _parseNum(String s) => double.parse(s.trim().replaceAll(',', '.'));

  List<double> _read6Months() => [
    _parseNum(_m1.text),
    _parseNum(_m2.text),
    _parseNum(_m3.text),
    _parseNum(_m4.text),
    _parseNum(_m5.text),
    _parseNum(_m6.text),
  ];

  @override
  void initState() {
    super.initState();
    _syncCityDefault();
    _syncCategoryDefault();
    _loadCatalog();
  }

  void _syncCityDefault() {
    final list = distributorCities[_dist] ?? const <String>[];
    _cityKey = list.isNotEmpty ? list.first : 'LA PAZ';
  }

  void _syncCategoryDefault() {
    final cats = categoriesFor(_dist);
    _cat = cats.isNotEmpty ? cats.first : '';
  }

  Future<void> _loadCatalog() async {
    try {
      final repo = CatalogRepository();
      final data = await repo.load();
      if (!mounted) return;
      setState(() {
        _catalog = data;
        _catalogError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _catalog = null;
        _catalogError = 'Error cargando catálogo: $e';
      });
    }
  }

  void _dimensionarYCalcularPayback() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_catalog == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo cargar el catálogo.')),
      );
      return;
    }
    if (_cat.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una categoría para Payback.')),
      );
      return;
    }

    final city = citiesHsp[normKey(_cityKey)];
    if (city == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ciudad no encontrada en HSP: $_cityKey')),
      );
      return;
    }

    final input = SizingInput(
      last6MonthsKwh: _read6Months(),
      offsetPercent: _parseNum(_offsetPct.text),
      cityKey: _cityKey,
      mountType: _mount,
      orientation: _orientation,
      pr: _parseNum(_pr.text),
      dcAcRatioTarget: _parseNum(_dcac.text),
      allowBifacial: true,
    );

    final sizingService = SizingService();
    final sizingRes = sizingService.size(input: input, catalog: _catalog!);

    // Estimar energía FV mensual
    final pvKwhMonthly = sizingRes.pdcRealKw * city.hsp * input.pr * 30.0;

    // Economía
    final billingService = BillingService();
    final econService = EconomicsService();

    final econRes = econService.compute(
      input: EconomicsInput(
        capexBs: sizingRes.capexBs,
        opexPctAnnual: (_parseNum(_opexPct.text) / 100.0),
        kwhAvg: sizingRes.kwhAvg,
        pvKwhMonthly: pvKwhMonthly,
        distributor: _dist,
        categoryKey: _cat,
      ),
      billingService: billingService,
      tariffCatalog: tariffCatalog,
    );

    setState(() {
      _result = sizingRes;
      _econ = econRes;
    });
  }

  @override
  void dispose() {
    _m1.dispose();
    _m2.dispose();
    _m3.dispose();
    _m4.dispose();
    _m5.dispose();
    _m6.dispose();
    _offsetPct.dispose();
    _pr.dispose();
    _dcac.dispose();
    _opexPct.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cities = distributorCities[_dist] ?? const <String>[];
    final cityInfo = citiesHsp[normKey(_cityKey)];
    final cats = categoriesFor(_dist);

    return Scaffold(
      appBar: AppBar(title: const Text('Dimensionamiento + Payback')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                if (_catalogError != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(_catalogError!),
                    ),
                  ),
                if (_catalog == null && _catalogError == null)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Cargando catálogo AutoSolar...'),
                    ),
                  ),

                DropdownButtonFormField<Distributor>(
                  value: _dist,
                  decoration: const InputDecoration(labelText: 'Distribuidora'),
                  items: const [
                    DropdownMenuItem(
                      value: Distributor.cessa,
                      child: Text('CESSA'),
                    ),
                    DropdownMenuItem(
                      value: Distributor.delapaz,
                      child: Text('DELAPAZ'),
                    ),
                    DropdownMenuItem(
                      value: Distributor.elfec,
                      child: Text('ELFEC'),
                    ),
                    DropdownMenuItem(
                      value: Distributor.endeDeoruro,
                      child: Text('ENDE ORURO'),
                    ),
                    DropdownMenuItem(
                      value: Distributor.endeDelbeni,
                      child: Text('ENDE DELBENI'),
                    ),
                    DropdownMenuItem(
                      value: Distributor.cre,
                      child: Text('CRE R.L.'),
                    ),
                  ],
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() {
                      _dist = v;
                      _syncCityDefault();
                      _syncCategoryDefault();
                      _result = null;
                      _econ = null;
                    });
                  },
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: _cityKey,
                  decoration: const InputDecoration(
                    labelText: 'Ciudad (HSP diseño)',
                  ),
                  items: (cities.isEmpty ? citiesHsp.keys.toList() : cities)
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() {
                      _cityKey = v;
                      _result = null;
                      _econ = null;
                    });
                  },
                ),
                const SizedBox(height: 8),
                if (cityInfo != null)
                  Text(
                    'HSP: ${cityInfo.hsp} | Lat: ${cityInfo.latitude}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _cat.isEmpty ? null : _cat,
                  decoration: const InputDecoration(
                    labelText: 'Categoría (para Payback)',
                  ),
                  items: cats
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() {
                      _cat = v;
                      _econ = null;
                    });
                  },
                ),

                const SizedBox(height: 16),
                Text(
                  'Consumo últimos 6 meses (kWh)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _kwhField(_m1, 'Mes 1'),
                _kwhField(_m2, 'Mes 2'),
                _kwhField(_m3, 'Mes 3'),
                _kwhField(_m4, 'Mes 4'),
                _kwhField(_m5, 'Mes 5'),
                _kwhField(_m6, 'Mes 6'),

                const SizedBox(height: 12),
                TextFormField(
                  controller: _offsetPct,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Objetivo de compensación (%)',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Ingresa %';
                    final x = _parseNum(v);
                    if (x <= 0 || x > 100) return 'Debe ser 0–100';
                    return null;
                  },
                ),

                const SizedBox(height: 12),
                DropdownButtonFormField<MountType>(
                  value: _mount,
                  decoration: const InputDecoration(labelText: 'Montaje'),
                  items: const [
                    DropdownMenuItem(
                      value: MountType.roof,
                      child: Text('Techo'),
                    ),
                    DropdownMenuItem(
                      value: MountType.ground,
                      child: Text('Suelo'),
                    ),
                  ],
                  onChanged: (v) => setState(() {
                    if (v != null) _mount = v;
                    _result = null;
                    _econ = null;
                  }),
                ),

                const SizedBox(height: 12),
                DropdownButtonFormField<PvOrientation>(
                  value: _orientation,
                  decoration: const InputDecoration(labelText: 'Orientación'),
                  items: const [
                    DropdownMenuItem(
                      value: PvOrientation.north,
                      child: Text('Norte'),
                    ),
                    DropdownMenuItem(
                      value: PvOrientation.notNorth,
                      child: Text('No norte'),
                    ),
                  ],
                  onChanged: (v) => setState(() {
                    if (v != null) _orientation = v;
                    _result = null;
                    _econ = null;
                  }),
                ),

                const SizedBox(height: 12),
                TextFormField(
                  controller: _pr,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'PR (Performance Ratio)',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Ingresa PR';
                    final x = _parseNum(v);
                    if (x < 0.6 || x > 0.9) return 'Rango típico 0.60–0.90';
                    return null;
                  },
                ),

                const SizedBox(height: 12),
                TextFormField(
                  controller: _dcac,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'DC/AC objetivo',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Ingresa DC/AC';
                    final x = _parseNum(v);
                    if (x < 1.05 || x > 1.40) return 'Rango típico 1.05–1.40';
                    return null;
                  },
                ),

                const SizedBox(height: 12),
                TextFormField(
                  controller: _opexPct,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'OPEX anual (% del CAPEX)',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Ingresa OPEX %';
                    final x = _parseNum(v);
                    if (x < 0 || x > 10) return 'Rango típico 0–10%';
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                FilledButton(
                  onPressed: (_catalog == null || cats.isEmpty)
                      ? null
                      : _dimensionarYCalcularPayback,
                  child: const Text('Dimensionar + Payback'),
                ),

                const SizedBox(height: 16),
                if (_result != null) _resultCard(_result!),
                if (_econ != null) _economicsCard(_econ!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _kwhField(TextEditingController ctrl, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: ctrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label),
        validator: (v) {
          if (v == null || v.trim().isEmpty) return 'Ingresa kWh';
          final x = _parseNum(v);
          if (x < 0) return 'No puede ser negativo';
          return null;
        },
      ),
    );
  }

  Widget _resultCard(SizingResult r) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dimensionamiento',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Consumo promedio: ${r.kwhAvg.toStringAsFixed(1)} kWh/mes'),
            Text(
              'Objetivo compensación: ${r.kwhTarget.toStringAsFixed(1)} kWh/mes',
            ),
            Text('HSP diseño: ${r.hspDesign.toStringAsFixed(2)}'),
            Text('Pdc requerida: ${r.pdcRequiredKw.toStringAsFixed(2)} kW'),
            const SizedBox(height: 8),
            Text('Panel: ${r.panelName}'),
            Text(
              'Módulos: ${r.modulesQty} x ${r.moduleWp.toStringAsFixed(0)} Wp = ${r.pdcRealKw.toStringAsFixed(2)} kWdc',
            ),
            const SizedBox(height: 8),
            Text('Inversor: ${r.inverterName}'),
            Text(
              'Potencia inversor: ${r.inverterAcKw.toStringAsFixed(2)} kWac',
            ),
            const SizedBox(height: 8),
            Text('CAPEX total: ${r.capexBs.toStringAsFixed(2)} Bs'),
          ],
        ),
      ),
    );
  }

  Widget _economicsCard(EconomicsResult e) {
    final paybackTxt = e.paybackYears.isFinite
        ? e.paybackYears.toStringAsFixed(2)
        : 'No recupera';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recuperación de la inversión',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Factura sin FV: ${e.bill0TotalBs.toStringAsFixed(2)} Bs/mes'),
            Text('Factura con FV: ${e.bill1TotalBs.toStringAsFixed(2)} Bs/mes'),
            const SizedBox(height: 8),
            Text('Ahorro mensual: ${e.monthlySavingsBs.toStringAsFixed(2)} Bs'),
            Text('Ahorro anual: ${e.annualSavingsBs.toStringAsFixed(2)} Bs'),
            Text('OPEX anual: ${e.annualOpexBs.toStringAsFixed(2)} Bs'),
            Text('Ahorro neto anual: ${e.netAnnualBs.toStringAsFixed(2)} Bs'),
            const SizedBox(height: 8),
            Text('Payback: $paybackTxt años'),
          ],
        ),
      ),
    );
  }
}

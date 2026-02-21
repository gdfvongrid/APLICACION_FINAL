// lib/features/sizing/sizing_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
// 1) AGREGA ESTE MAPA (en el mismo archivo sizing_screen.dart, arriba de la clase,
//    por ejemplo debajo de los imports)

// Factores estacionales típicos por mes (La Paz/altiplano como referencia):
// - pico en verano (Nov–Feb), valle en invierno (Jun–Jul)
// - promedio anual ≈ 1.0
const List<double> _seasonalPvMonthFactors = <double>[
  1.06, // Ene
  1.05, // Feb
  1.02, // Mar
  0.98, // Abr
  0.93, // May
  0.90, // Jun
  0.88, // Jul (mínimo)
  0.92, // Ago
  0.97, // Sep
  1.02, // Oct
  1.06, // Nov
  1.07, // Dic
];

class SizingScreen extends StatefulWidget {
  const SizingScreen({super.key});

  @override
  State<SizingScreen> createState() => _SizingScreenState();
}

class _SizingScreenState extends State<SizingScreen> {
  final _formKey = GlobalKey<FormState>();

  Distributor _dist = Distributor.cessa;
  String _cityKey = 'SUCRE';

  // Categoría para payback (key de billing_tariffs.dart)
  String _cat = '';

  // Promedio (últimos 6 meses)
  final _kwhAvg = TextEditingController(text: '250');

  final _offsetPct = TextEditingController(text: '70'); // %
  final _pr = TextEditingController(text: '0.80'); // PR
  final _dcac = TextEditingController(text: '1.40'); // DC/AC

  // OPEX anual (% del CAPEX)
  final _opexPct = TextEditingController(text: '1.0');

  MountType _mount = MountType.roof;
  PvOrientation _orientation = PvOrientation.north;

  CatalogData? _catalog;
  String? _catalogError;

  SizingResult? _result;
  EconomicsResult? _econ;
  double? _pvKwhMonthly;

  double _parseNum(String s) => double.parse(s.trim().replaceAll(',', '.'));

  List<double> _readAvgAs6Months() {
    final avg = _parseNum(_kwhAvg.text);
    return List<double>.filled(6, avg);
  }

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
      last6MonthsKwh: _readAvgAs6Months(),
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

    // Estimar energía FV mensual (kWh/mes)
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
      _pvKwhMonthly = pvKwhMonthly;
    });
  }

  @override
  void dispose() {
    _kwhAvg.dispose();
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
      appBar: AppBar(
        title: const Text(
          'Dimensionamiento Generación Distribuida Fotovoltaico',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Inicio',
            onPressed: () => context.go('/'),
          ),
        ],
      ),
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
                      _pvKwhMonthly = null;
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
                      _pvKwhMonthly = null;
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
                      _pvKwhMonthly = null;
                    });
                  },
                ),

                const SizedBox(height: 16),
                Text(
                  'Promedio consumo últimos 6 meses (kWh/mes)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _kwhAvg,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'kWh/mes (promedio 6 meses)',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty)
                      return 'Ingresa kWh promedio';
                    final x = _parseNum(v);
                    if (x < 0) return 'No puede ser negativo';
                    return null;
                  },
                ),

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
                    _pvKwhMonthly = null;
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
                    _pvKwhMonthly = null;
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
                  child: const Text('Dimensionamiento + Payback'),
                ),

                const SizedBox(height: 16),

                if (_result != null && _econ != null && _pvKwhMonthly != null)
                  _resultsDashboard(
                    context: context,
                    r: _result!,
                    e: _econ!,
                    pvKwhMonthly: _pvKwhMonthly!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========================
  // UI: Dashboard Resultados
  // =========================

  Widget _resultsDashboard({
    required BuildContext context,
    required SizingResult r,
    required EconomicsResult e,
    required double pvKwhMonthly,
  }) {
    final months = const [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];

    final consumption = List<double>.filled(12, r.kwhAvg);

    // Producción estacional más realista
    final base = pvKwhMonthly;
    final production = List<double>.generate(
      12,
      (i) => base * _seasonalPvMonthFactors[i],
    );

    final paybackTxt = e.paybackYears.isFinite
        ? '${e.paybackYears.toStringAsFixed(1)} años'
        : 'No recupera';

    return Column(
      children: [
        _powerHeroCard(context: context, kwp: r.pdcRealKw),
        const SizedBox(height: 12),

        // DATOS DIMENSIONADOS (módulos + inversor + conexión)
        _sizingDetailsCard(context: context, r: r),
        const SizedBox(height: 12),

        // Recuperación de la inversión (3 tarjetas)
        _paybackMetricsRow(
          context: context,
          capexBs: r.capexBs,
          annualSavingsBs: e.annualSavingsBs,
          paybackTxt: paybackTxt,
        ),
        const SizedBox(height: 12),

        _bannerCard(
          context: context,
          text: e.paybackYears.isFinite
              ? 'El retorno de inversión se logrará en ${_yearsToYearsMonths(e.paybackYears)}.'
              : 'Con los parámetros actuales, no se recupera la inversión.',
        ),
        const SizedBox(height: 12),

        _chartCard(
          context: context,
          months: months,
          production: production,
          consumption: consumption,
        ),
      ],
    );
  }

  Widget _powerHeroCard({required BuildContext context, required double kwp}) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Resultados del Análisis',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              'Potencia del Sistema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              '${kwp.toStringAsFixed(1)} kWp',
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              child: Text(
                'Potencia Recomendada',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // NUEVO: Datos dimensionados
  // =========================
  Widget _sizingDetailsCard({
    required BuildContext context,
    required SizingResult r,
  }) {
    final modules = r.modulesQty;
    final modWp = r.moduleWp;
    final invName = r.inverterName;
    final invAcKw = r.inverterAcKw;

    // Estos 3 dependen del parche en sizing_model.dart
    final dcac = r.dcAcRatio;
    final connection = r.connection;
    final strings = r.stringing;

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Datos Dimensionados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),

            _kvRow(
              'Módulos FV',
              '$modules u (${modWp.toStringAsFixed(0)} Wp c/u)',
            ),
            const SizedBox(height: 8),
            _kvRow(
              'Potencia DC instalada',
              '${r.pdcRealKw.toStringAsFixed(2)} kWp',
            ),
            const SizedBox(height: 8),
            _kvRow(
              'Inversor',
              '$invName (${invAcKw.toStringAsFixed(2)} kW AC)',
            ),
            const SizedBox(height: 8),
            _kvRow('Relación DC/AC', dcac.toStringAsFixed(2)),

            if (connection.trim().isNotEmpty) ...[
              const SizedBox(height: 8),
              _kvRow('Conexión', connection),
            ],
            if (strings.trim().isNotEmpty) ...[
              const SizedBox(height: 8),
              _kvRow('Configuración strings', strings),
            ],
          ],
        ),
      ),
    );
  }

  Widget _kvRow(String k, String v) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(k, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(v, textAlign: TextAlign.right)),
      ],
    );
  }

  // “Recuperación de la inversión” (3 tarjetas)
  Widget _paybackMetricsRow({
    required BuildContext context,
    required double capexBs,
    required double annualSavingsBs,
    required String paybackTxt,
  }) {
    return Row(
      children: [
        Expanded(
          child: _miniMetricCard(
            context: context,
            icon: Icons.payments_outlined,
            title: 'Inversión Inicial',
            value: 'Bs ${capexBs.toStringAsFixed(0)}',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _miniMetricCard(
            context: context,
            icon: Icons.savings_outlined,
            title: 'Ahorro Anual',
            value: 'Bs ${annualSavingsBs.toStringAsFixed(0)}',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _miniMetricCard(
            context: context,
            icon: Icons.schedule_outlined,
            title: 'Tiempo de Retorno',
            value: paybackTxt,
          ),
        ),
      ],
    );
  }

  Widget _chartCard({
    required BuildContext context,
    required List<String> months,
    required List<double> production,
    required List<double> consumption,
  }) {
    final maxY = max(production.reduce(max), consumption.reduce(max));

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Generación Solar Mensual',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: _SimpleBarsWithLine(
                months: months,
                bars: production,
                line: consumption,
                maxY: maxY <= 0 ? 1 : maxY,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _legendDot(context, label: 'Producción Solar', isBar: true),
                const SizedBox(width: 16),
                _legendDot(context, label: 'Consumo Mensual', isBar: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(
    BuildContext context, {
    required String label,
    required bool isBar,
  }) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isBar
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _miniMetricCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 26),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 6),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bannerCard({required BuildContext context, required String text}) {
    return Card(
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.10),
        ),
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  String _yearsToYearsMonths(double years) {
    final totalMonths = (years * 12).round();
    final y = totalMonths ~/ 12;
    final m = totalMonths % 12;
    if (m == 0) return '$y años';
    return '$y años y $m meses';
  }
}

/// Gráfico simple sin paquetes: barras (producción) + línea (consumo)
class _SimpleBarsWithLine extends StatelessWidget {
  const _SimpleBarsWithLine({
    required this.months,
    required this.bars,
    required this.line,
    required this.maxY,
  });

  final List<String> months;
  final List<double> bars;
  final List<double> line;
  final double maxY;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BarsLinePainter(
        bars: bars,
        line: line,
        maxY: maxY,
        barColor: Theme.of(context).colorScheme.primary,
        lineColor: Theme.of(context).colorScheme.tertiary,
        gridColor: Theme.of(context).dividerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, bottom: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(12, (i) {
            return Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  months[i],
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BarsLinePainter extends CustomPainter {
  _BarsLinePainter({
    required this.bars,
    required this.line,
    required this.maxY,
    required this.barColor,
    required this.lineColor,
    required this.gridColor,
  });

  final List<double> bars;
  final List<double> line;
  final double maxY;
  final Color barColor;
  final Color lineColor;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paintGrid = Paint()
      ..color = gridColor.withOpacity(0.35)
      ..strokeWidth = 1;

    // Grid horizontal
    for (int g = 1; g <= 4; g++) {
      final y = size.height * (g / 5);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paintGrid);
    }

    final barPaint = Paint()..color = barColor.withOpacity(0.90);
    final linePaint = Paint()
      ..color = lineColor.withOpacity(0.95)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()..color = lineColor.withOpacity(0.95);

    final w = size.width;
    final h = size.height;
    const n = 12;
    final step = w / n;
    final barW = step * 0.55;

    // Barras
    for (int i = 0; i < n; i++) {
      final v = bars[i];
      final bh = (v / maxY) * (h * 0.82);
      final x = i * step + (step - barW) / 2;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, h - bh, barW, bh),
        const Radius.circular(6),
      );
      canvas.drawRRect(rect, barPaint);
    }

    // Línea
    final path = Path();
    for (int i = 0; i < n; i++) {
      final v = line[i];
      final y = h - (v / maxY) * (h * 0.82);
      final x = i * step + step / 2;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, linePaint);

    // Puntos
    for (int i = 0; i < n; i++) {
      final v = line[i];
      final y = h - (v / maxY) * (h * 0.82);
      final x = i * step + step / 2;
      canvas.drawCircle(Offset(x, y), 3.2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BarsLinePainter oldDelegate) {
    return oldDelegate.maxY != maxY ||
        oldDelegate.bars != bars ||
        oldDelegate.line != line ||
        oldDelegate.barColor != barColor ||
        oldDelegate.lineColor != lineColor;
  }
}

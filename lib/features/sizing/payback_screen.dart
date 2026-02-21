import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../billing/billing_service.dart';
import '../billing/billing_tariffs.dart';
import '../economics/economics_model.dart';
import '../economics/economics_service.dart';
import 'payback_args.dart';

// Factores estacionales típicos por mes (Altiplano ref.)
// Promedio anual ≈ 1.0
const List<double> _seasonalPvMonthFactors = <double>[
  1.06, // Ene
  1.05, // Feb
  1.02, // Mar
  0.98, // Abr
  0.93, // May
  0.90, // Jun
  0.88, // Jul
  0.92, // Ago
  0.97, // Sep
  1.02, // Oct
  1.06, // Nov
  1.07, // Dic
];

class PaybackScreen extends StatelessWidget {
  const PaybackScreen({super.key, required this.args});

  final PaybackArgs args;

  @override
  Widget build(BuildContext context) {
    // Economía (se calcula aquí, no en sizing)
    final billingService = BillingService();
    final econService = EconomicsService();

    final e = econService.compute(
      input: EconomicsInput(
        capexBs: args.sizing.capexBs,
        opexPctAnnual: (args.opexPct / 100.0),
        kwhAvg: args.sizing.kwhAvg,
        pvKwhMonthly: args.pvKwhMonthly,
        distributor: args.distributor,
        categoryKey: args.categoryKey,
      ),
      billingService: billingService,
      tariffCatalog: tariffCatalog,
    );

    final months = const ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'];

    final consumption = List<double>.filled(12, args.sizing.kwhAvg);
    final production = List<double>.generate(
      12,
      (i) => args.pvKwhMonthly * _seasonalPvMonthFactors[i],
    );

    final paybackTxt = e.paybackYears.isFinite ? '${e.paybackYears.toStringAsFixed(1)} años' : 'No recupera';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperación de la inversión'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              _paybackMetricsRow(
                context: context,
                capexBs: args.sizing.capexBs,
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
          ),
        ),
      ),
    );
  }

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
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
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
            Text('Generación Solar Mensual', style: Theme.of(context).textTheme.titleMedium),
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

  Widget _legendDot(BuildContext context, {required String label, required bool isBar}) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isBar ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
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
                child: Text(months[i], style: Theme.of(context).textTheme.labelSmall),
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

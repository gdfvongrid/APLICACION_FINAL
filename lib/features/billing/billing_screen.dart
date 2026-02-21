import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'billing_model.dart';
import 'billing_service.dart';
import 'billing_tariffs.dart';

final billingServiceProvider = Provider((ref) => BillingService());

class BillingScreen extends ConsumerStatefulWidget {
  const BillingScreen({super.key});

  @override
  ConsumerState<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends ConsumerState<BillingScreen> {
  final _formKey = GlobalKey<FormState>();

  // Por defecto: CESSA
  Distributor _dist = Distributor.cessa;
  String _cat = '';

  final _kwhCtrl = TextEditingController(text: '250');

  BillingResult? _result;

  // Para poder calcular la tarifa promedio (Bs/kWh) en pantalla
  double? _lastKwh;

  double _parseNum(String s) {
    final normalized = s.trim().replaceAll(',', '.');
    return double.parse(normalized);
  }

  void _syncDefaults() {
    final cats = categoriesFor(_dist);
    if (cats.isEmpty) {
      _cat = '';
      _result = null;
      _lastKwh = null;
      return;
    }
    if (_cat.isEmpty || !cats.contains(_cat)) {
      _cat = cats.first;
    }
    _result = null;
    _lastKwh = null;
  }

  @override
  void initState() {
    super.initState();
    _syncDefaults();
  }

  void _calculate() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_cat.isEmpty) return;

    final kwh = _parseNum(_kwhCtrl.text);
    final tariff = tariffFor(_dist, _cat);
    final service = ref.read(billingServiceProvider);

    setState(() {
      _lastKwh = kwh;
      _result = service.calculateWithBlocks(kwhMonth: kwh, tariff: tariff);
    });
  }

  @override
  void dispose() {
    _kwhCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cats = categoriesFor(_dist);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Facturación (por bloques)'),
        actions: [
          IconButton(
            tooltip: 'Inicio',
            icon: const Icon(Icons.home),
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
                      _syncDefaults();
                    });
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _cat.isEmpty ? null : _cat,
                  decoration: const InputDecoration(labelText: 'Categoría'),
                  items: cats
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: cats.isEmpty
                      ? null
                      : (v) {
                          if (v == null) return;
                          setState(() {
                            _cat = v;
                            _syncDefaults();
                          });
                        },
                ),
                const SizedBox(height: 12),
                if (cats.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'No hay datos de tarifas para esta distribuidora en el Excel cargado.',
                      ),
                    ),
                  ),
                TextFormField(
                  controller: _kwhCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Energía mensual (kWh)',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Ingresa kWh';
                    try {
                      final parsed = _parseNum(v);
                      if (parsed <= 0) return 'kWh debe ser > 0';
                    } catch (_) {
                      return 'Número inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: cats.isEmpty ? null : _calculate,
                  child: const Text(
                    'Calcular tarifa (Sin Generación Distribuida)',
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => context.go('/sizing'),
                  child: const Text(
                    'Ir a Dimensionamiento del sistema GD y retorno de inversión',
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 320),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, anim) {
                    final fade = CurvedAnimation(
                      parent: anim,
                      curve: Curves.easeOutCubic,
                    );
                    final slide =
                        Tween<Offset>(
                          begin: const Offset(0, 0.04),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: anim,
                            curve: Curves.easeOutCubic,
                          ),
                        );

                    return FadeTransition(
                      opacity: fade,
                      child: SlideTransition(position: slide, child: child),
                    );
                  },
                  child: (_result == null)
                      ? const SizedBox.shrink()
                      : _ResultCard(
                          key: ValueKey<String>(
                            '${_dist.name}_${_cat}_'
                            '${_result!.totalBs.toStringAsFixed(2)}_'
                            '${_lastKwh?.toStringAsFixed(3) ?? "na"}',
                          ),
                          result: _result!,
                          kwh: _lastKwh ?? 0,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({super.key, required this.result, required this.kwh});

  final BillingResult result;
  final double kwh;

  @override
  Widget build(BuildContext context) {
    final avgRate = (kwh > 0) ? (result.energyChargeBs / kwh) : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resultado', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _ResultChip(
                    label: 'Tarifa promedio',
                    value: 'Bs ${avgRate.toStringAsFixed(4)}/kWh',
                    icon: Icons.bolt,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _ResultChip(
                    label: 'Total',
                    value: 'Bs ${result.totalBs.toStringAsFixed(2)}',
                    icon: Icons.payments_outlined,
                    highlight: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Opcional: si quieres mostrar también el cargo de energía en Bs
            // Text('Cargo energía: Bs ${result.energyChargeBs.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

class _ResultChip extends StatelessWidget {
  const _ResultChip({
    required this.label,
    required this.value,
    required this.icon,
    this.highlight = false,
  });

  final String label;
  final String value;
  final IconData icon;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final baseColor = cs.surfaceVariant;
    final bg = highlight ? cs.primaryContainer : baseColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: highlight ? cs.primary.withOpacity(0.25) : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: highlight ? cs.primary : cs.onSurfaceVariant),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

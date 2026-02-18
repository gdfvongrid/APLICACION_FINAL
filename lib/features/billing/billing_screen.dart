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

  Distributor _dist = Distributor.elfec;
  String _cat = '';

  final _kwhCtrl = TextEditingController(text: '250');
  final _rateCtrl = TextEditingController(text: '-'); // por bloques
  final _fixedCtrl = TextEditingController(text: '0');

  BillingResult? _result;

  double _parseNum(String s) {
    final normalized = s.trim().replaceAll(',', '.');
    return double.parse(normalized);
  }

  void _syncDefaults() {
    final cats = categoriesFor(_dist);
    if (cats.isEmpty) {
      _cat = '';
      _fixedCtrl.text = '0';
      _rateCtrl.text = '-';
      _result = null;
      return;
    }
    if (_cat.isEmpty || !cats.contains(_cat)) {
      _cat = cats.first;
    }
    final t = tariffFor(_dist, _cat);
    _fixedCtrl.text = t.fixedChargeBs.toStringAsFixed(3);
    _rateCtrl.text = '-';
    _result = null;
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
      _fixedCtrl.text = tariff.fixedChargeBs.toStringAsFixed(3);
      _rateCtrl.text = '-';
      _result = service.calculateWithBlocks(kwhMonth: kwh, tariff: tariff);
    });
  }

  @override
  void dispose() {
    _kwhCtrl.dispose();
    _rateCtrl.dispose();
    _fixedCtrl.dispose();
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
                      _parseNum(v);
                    } catch (_) {
                      return 'Número inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _rateCtrl,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Tarifa energía (Bs/kWh)',
                  ),
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _fixedCtrl,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Cargo fijo / Cmin (Bs/mes)',
                  ),
                ),

                const SizedBox(height: 16),
                FilledButton(
                  onPressed: cats.isEmpty ? null : _calculate,
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 12),

                OutlinedButton(
                  onPressed: () => context.go('/sizing'),
                  child: const Text('Ir a Dimensionamiento + Payback'),
                ),

                const SizedBox(height: 16),
                if (_result != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resultado',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Cargo energía: ${_result!.energyChargeBs.toStringAsFixed(2)} Bs',
                          ),
                          Text(
                            'Total: ${_result!.totalBs.toStringAsFixed(2)} Bs',
                          ),
                        ],
                      ),
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

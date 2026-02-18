import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GD FV Bolivia')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _Tile(
              title: '1) Facturación eléctrica',
              subtitle:
                  'Cálculo por bloques de energía (kWh) según distribuidora y categoría.',
              icon: Icons.receipt_long,
              onTap: () => context.go('/billing'),
            ),
            const SizedBox(height: 12),
            _Tile(
              title: '2) Dimensionamiento FV on-grid',
              subtitle:
                  'Dimensionamiento (Nivel B) con HSP por ciudad + catálogo AutoSolar.',
              icon: Icons.solar_power,
              onTap: () => context.go('/sizing'),
            ),
            const SizedBox(height: 12),
            _Tile(
              title: '3) Recuperación de la inversión',
              subtitle: 'Payback (por ahora integrado en Dimensionamiento).',
              icon: Icons.trending_up,
              onTap: () => context.go('/sizing'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nota: El módulo de tarifas se optimizará para leer Excel/JSON y no hardcodear estructuras.',
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

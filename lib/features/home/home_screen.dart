import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _fade = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.03),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('SOLAR RATE', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Calculadora de Generación Distribuida Fotovoltaica OnGrid Bolivia',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                _Tile(
                  title: 'Facturación eléctrica Bolivia',
                  subtitle:
                      'Cálculo del monto de tu factura en bolivianos (Bs), según la empresa eléctrica y la categoría a la que perteneces.',
                  icon: Icons.receipt_long,
                  onTap: () => context.go('/billing'),
                ),
                const SizedBox(height: 12),
                _Tile(
                  title: 'Dimensionamiento FV on-grid',
                  subtitle:
                      'Dimensionamiento del sistema de Generación Distribuida Fotovoltaico conectado a red.',
                  icon: Icons.solar_power,
                  onTap: () => context.go('/sizing'),
                ),
                const SizedBox(height: 12),
                _Tile(
                  title: 'Recuperación de la inversión',
                  subtitle:
                      'Tiempo de recuperación de la inversión del Sistema de Generación Distribuida (Payback)',
                  icon: Icons.trending_up,
                  onTap: () => context.go('/sizing'),
                ),
                const SizedBox(height: 24),
                Card(
                  color: Theme.of(
                    context,
                  ).colorScheme.surfaceVariant.withOpacity(0.35),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Esta aplicación constituye una herramienta de carácter orientativo y preliminar. '
                      'No reemplaza un estudio técnico especializado ni la elaboración de un proyecto de ingeniería formal.\n\n'
                      'Los cálculos se realizan con base en las estructuras tarifarias vigentes publicadas conforme a las resoluciones emitidas por el ente regulador competente. '
                      'Los costos referenciales de equipos han sido obtenidos de información pública de AutoSolar.pe. '
                      'Los resultados son estimativos y pueden variar según las condiciones particulares de cada usuario y futuras actualizaciones normativas.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 11, // Más pequeño
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatefulWidget {
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
  State<_Tile> createState() => _TileState();
}

class _TileState extends State<_Tile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AnimatedScale(
      scale: _pressed ? 0.98 : 1.0,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: widget.onTap,
          onTapDown: (_) => setState(() => _pressed = true),
          onTapCancel: () => setState(() => _pressed = false),
          onTapUp: (_) => setState(() => _pressed = false),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    widget.icon,
                    color: cs.onPrimaryContainer,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(
                            context,
                          ).textTheme.bodySmall?.color?.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.chevron_right, color: cs.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

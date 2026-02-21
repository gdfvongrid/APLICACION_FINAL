// lib/features/billing/blocks/tariff_blocks.dart

class EnergyBlock {
  /// Límite inferior exclusivo del tramo (kWh). Ej: 20 significa (20..end]
  final double startKwhExclusive;

  /// Límite superior inclusivo del tramo (kWh). null = infinito.
  final double? endKwhInclusive;

  /// Tarifa del tramo (Bs/kWh)
  final double rateBsPerKwh;

  /// Para TOU (bloques horarios): 'alto', 'medio', 'bajo' o null si no aplica.
  final String? tou;

  const EnergyBlock({
    required this.startKwhExclusive,
    required this.endKwhInclusive,
    required this.rateBsPerKwh,
    this.tou,
  });
}

class BlockTariff {
  /// Cargo fijo/Cmin (Bs/mes)
  final double fixedChargeBs;

  /// Bloques de energía (pueden ser por rango o TOU)
  final List<EnergyBlock> blocks;

  const BlockTariff({required this.fixedChargeBs, required this.blocks});

  bool get isTou => blocks.any((b) => (b.tou ?? '').isNotEmpty);
}

/// Calcula el cargo por energía.
/// - Caso A (por rangos): usa kwhMonth y bloques por tramos.
/// - Caso B (TOU): usa kwhAlto/kwhMedio/kwhBajo y rates etiquetados con tou.
double computeEnergyCharge(
  double kwhMonth,
  List<EnergyBlock> blocks, {
  double? kwhAlto,
  double? kwhMedio,
  double? kwhBajo,
}) {
  final isTou = blocks.any((b) => (b.tou ?? '').isNotEmpty);

  // Caso B: TOU (bloques horarios)
  if (isTou) {
    if (kwhAlto == null || kwhMedio == null || kwhBajo == null) {
      throw ArgumentError('Tarifa TOU requiere kwhAlto, kwhMedio y kwhBajo.');
    }

    double rateOf(String tou) {
      final b = blocks.firstWhere(
        (x) => (x.tou ?? '').toLowerCase() == tou,
        orElse: () => throw StateError('Falta bloque TOU: $tou'),
      );
      return b.rateBsPerKwh;
    }

    final rAlto = rateOf('alto');
    final rMedio = rateOf('medio');
    final rBajo = rateOf('bajo');

    return (kwhAlto * rAlto) + (kwhMedio * rMedio) + (kwhBajo * rBajo);
  }

  // Caso A: por rangos (bloques acumulativos por tramo)
  double charge = 0.0;

  final sorted = [...blocks]
    ..sort((a, b) => a.startKwhExclusive.compareTo(b.startKwhExclusive));

  for (final b in sorted) {
    final start = b.startKwhExclusive;
    final end = b.endKwhInclusive; // null => infinito

    if (kwhMonth <= start) continue;

    final upper = end ?? kwhMonth;
    final tramo = (upper < kwhMonth ? upper : kwhMonth) - start;

    if (tramo > 0) {
      charge += tramo * b.rateBsPerKwh;
    }
  }

  return charge;
}
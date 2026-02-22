class EnergyBlock {
  final double startKwhExclusive;
  final double? endKwhInclusive;
  final double rateBsPerKwh;

  /// Para TOU: 'alto' | 'medio' | 'bajo'
  final String? tou;

  const EnergyBlock({
    required this.startKwhExclusive,
    required this.endKwhInclusive,
    required this.rateBsPerKwh,
    this.tou,
  });
}

class BlockTariff {
  final double fixedChargeBs;
  final List<EnergyBlock> blocks;

  const BlockTariff({
    required this.fixedChargeBs,
    required this.blocks,
  });

  bool get isTou => blocks.any((b) => (b.tou ?? '').isNotEmpty);
}

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
      throw ArgumentError('Tarifa TOU requiere kwhAlto/kwhMedio/kwhBajo');
    }

    double rateOf(String tou) {
      final b = blocks.firstWhere(
        (x) => (x.tou ?? '').toLowerCase() == tou,
        orElse: () => throw StateError('Falta bloque TOU: $tou'),
      );
      return b.rateBsPerKwh;
    }

    return (kwhAlto * rateOf('alto')) +
        (kwhMedio * rateOf('medio')) +
        (kwhBajo * rateOf('bajo'));
  }

  // Caso A: por rangos (bloques acumulativos)
  double charge = 0.0;

  final sorted = [...blocks]
    ..sort((a, b) => a.startKwhExclusive.compareTo(b.startKwhExclusive));

  for (final b in sorted) {
    final start = b.startKwhExclusive;
    final end = b.endKwhInclusive; // null => infinito

    if (kwhMonth <= start) continue;

    final upper = end ?? kwhMonth;
    final usedUpper = (upper < kwhMonth) ? upper : kwhMonth;
    final tramo = usedUpper - start;

    if (tramo > 0) charge += tramo * b.rateBsPerKwh;
  }

  return charge;
}
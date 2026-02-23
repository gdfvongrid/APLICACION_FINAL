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

   double computeBlockRanges(double kwh, List<EnergyBlock> rangeBlocks) {
    double charge = 0.0;

    final sorted = [...rangeBlocks]
      ..sort((a, b) => a.startKwhExclusive.compareTo(b.startKwhExclusive));

    for (final b in sorted) {
      final start = b.startKwhExclusive;
      final end = b.endKwhInclusive; // null => infinito

      if (kwh <= start) continue;

      final upper = end ?? kwh;
      final usedUpper = (upper < kwh) ? upper : kwh;
      final tramo = usedUpper - start;

      if (tramo > 0) charge += tramo * b.rateBsPerKwh;
    }

    return charge;
  }

  // Ca// Caso B: TOU (simple o TOU + bloques por rango)
  if (isTou) {
    if (kwhAlto == null || kwhMedio == null || kwhBajo == null) {
      throw ArgumentError('Tarifa TOU requiere kwhAlto/kwhMedio/kwhBajo');
    }

  List<EnergyBlock> blocksOf(String tou) {
      final filtered = blocks
          .where((x) => (x.tou ?? '').toLowerCase() == tou)
          .toList();

        if (filtered.isEmpty) {
        throw StateError('Falta bloque TOU: $tou');
      }

       return filtered;
    }

    final altoCharge = computeBlockRanges(kwhAlto, blocksOf('alto'));
    final medioCharge = computeBlockRanges(kwhMedio, blocksOf('medio'));
    final bajoCharge = computeBlockRanges(kwhBajo, blocksOf('bajo'));
    
    return altoCharge + medioCharge + bajoCharge;
  }

  // Caso A: por rangos (bloques acumulativos)
  return computeBlockRanges(kwhMonth, blocks);
}

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

    final rAlto = rateOf('alto');
    final rMedio = rateOf('medio');
    final rBajo = rateOf('bajo');

    return (kwhAlto * rAlto) + (kwhMedio * rMedio) + (kwhBajo * rBajo);
  }

  // Caso A: por rangos (bloques acumulativos)
  double charge = 0.0;

  // ordenar por inicio
  final sorted = [...blocks]
    ..sort((a, b) => a.startKwhExclusive.compareTo(b.startKwhExclusive));

  for (final b in sorted) {
    final start = b.startKwhExclusive;
    final end = b.endKwhInclusive;

    // Energía dentro del tramo (start..end]
    final upper = end ?? double.infinity;
    final tramo = (kwhMonth.clamp(start, upper) - start);

    if (tramo > 0) {
      charge += tramo * b.rateBsPerKwh;
    }
  }

  return charge;
}

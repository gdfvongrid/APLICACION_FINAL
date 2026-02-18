class EnergyBlock {
  const EnergyBlock({
    required this.startKwhExclusive,
    required this.endKwhInclusive,
    required this.rateBsPerKwh,
  });

  final double startKwhExclusive; // ej. 20 significa "desde >20"
  final double? endKwhInclusive; // null = sin límite superior
  final double rateBsPerKwh;
}

class BlockTariff {
  const BlockTariff({required this.fixedChargeBs, required this.blocks});

  final double fixedChargeBs;
  final List<EnergyBlock> blocks;
}

double computeEnergyCharge(double kwh, List<EnergyBlock> blocks) {
  double charge = 0;

  for (final b in blocks) {
    final start = b.startKwhExclusive;
    if (kwh <= start) continue;

    final end = b.endKwhInclusive ?? kwh;
    final upper = kwh < end ? kwh : end;

    final tramo = upper - start;
    if (tramo > 0) {
      charge += tramo * b.rateBsPerKwh;
    }
  }

  return charge;
}

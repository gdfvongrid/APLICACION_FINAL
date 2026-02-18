import 'billing_model.dart';
import 'tariff_blocks.dart';

class BillingService {
  /// Método simple (energía * tarifa + fijo)
  BillingResult calculate(BillingInput input) {
    final energyCharge = input.kwhMonth * input.energyRateBsPerKwh;
    final total = energyCharge + input.fixedChargeBs;

    return BillingResult(energyChargeBs: energyCharge, totalBs: total);
  }

  /// Método por bloques (usa BlockTariff + EnergyBlock)
  BillingResult calculateWithBlocks({
    required double kwhMonth,
    required BlockTariff tariff,
  }) {
    final energyCharge = computeEnergyCharge(kwhMonth, tariff.blocks);
    final total = energyCharge + tariff.fixedChargeBs;

    return BillingResult(energyChargeBs: energyCharge, totalBs: total);
  }
}

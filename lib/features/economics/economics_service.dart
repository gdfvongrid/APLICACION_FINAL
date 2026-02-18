import '../billing/billing_service.dart';
import '../billing/billing_model.dart';
import '../billing/tariff_blocks.dart';
import 'economics_model.dart';

class EconomicsService {
  EconomicsResult compute({
    required EconomicsInput input,
    required BillingService billingService,
    required Map<Distributor, Map<String, BlockTariff>> tariffCatalog,
  }) {
    final tariff = tariffCatalog[input.distributor]?[input.categoryKey];
    if (tariff == null) {
      throw StateError('No existe tarifa: ${input.distributor} ${input.categoryKey}');
    }

    final bill0 = billingService.calculateWithBlocks(
      kwhMonth: input.kwhAvg,
      tariff: tariff,
    );

    final kwhNet = (input.kwhAvg - input.pvKwhMonthly).clamp(0.0, double.infinity);

    final bill1 = billingService.calculateWithBlocks(
      kwhMonth: kwhNet,
      tariff: tariff,
    );

    final monthlySavings = (bill0.totalBs - bill1.totalBs).clamp(0.0, double.infinity);
    final annualSavings = monthlySavings * 12.0;

    final annualOpex = input.capexBs * input.opexPctAnnual;
    final netAnnual = annualSavings - annualOpex;

    final paybackYears = netAnnual > 0 ? (input.capexBs / netAnnual) : double.infinity;

    return EconomicsResult(
      bill0TotalBs: bill0.totalBs,
      bill1TotalBs: bill1.totalBs,
      monthlySavingsBs: monthlySavings,
      annualSavingsBs: annualSavings,
      annualOpexBs: annualOpex,
      netAnnualBs: netAnnual,
      paybackYears: paybackYears,
    );
  }
}

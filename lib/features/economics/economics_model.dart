import '../billing/billing_model.dart';

class EconomicsInput {
  final double capexBs;
  final double opexPctAnnual; // 0.01 = 1%
  final double kwhAvg; // consumo mensual promedio (kWh/mes)
  final double pvKwhMonthly; // energía FV mensual estimada (kWh/mes)

  final Distributor distributor;
  final String categoryKey;

  const EconomicsInput({
    required this.capexBs,
    this.opexPctAnnual = 0.01,
    required this.kwhAvg,
    required this.pvKwhMonthly,
    required this.distributor,
    required this.categoryKey,
  });
}

class EconomicsResult {
  final double bill0TotalBs;
  final double bill1TotalBs;

  final double monthlySavingsBs;
  final double annualSavingsBs;

  final double annualOpexBs;
  final double netAnnualBs;

  final double paybackYears;

  const EconomicsResult({
    required this.bill0TotalBs,
    required this.bill1TotalBs,
    required this.monthlySavingsBs,
    required this.annualSavingsBs,
    required this.annualOpexBs,
    required this.netAnnualBs,
    required this.paybackYears,
  });
}

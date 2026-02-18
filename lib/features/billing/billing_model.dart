enum Distributor { delapaz, elfec, cessa, endeDeoruro, endeDelbeni, cre }

class BillingInput {
  BillingInput({
    required this.distributor,
    required this.kwhMonth,
    required this.energyRateBsPerKwh,
    required this.fixedChargeBs,
  });

  final Distributor distributor;
  final double kwhMonth;
  final double energyRateBsPerKwh;
  final double fixedChargeBs;
}

class BillingResult {
  BillingResult({required this.energyChargeBs, required this.totalBs});

  final double energyChargeBs;
  final double totalBs;
}


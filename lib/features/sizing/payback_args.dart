import 'package:gd_fv_app/features/billing/billing_model.dart';
import 'package:gd_fv_app/features/sizing/sizing_model.dart';

class PaybackArgs {
  final Distributor distributor;
  final String categoryKey;
  final double opexPct; // 0..100
  final double pvKwhMonthly; // promedio mensual estimado (kWh/mes)
  final SizingResult sizing;

  const PaybackArgs({
    required this.distributor,
    required this.categoryKey,
    required this.opexPct,
    required this.pvKwhMonthly,
    required this.sizing,
  });
}

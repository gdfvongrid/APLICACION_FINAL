// lib/features/sizing/sizing_model.dart
enum MountType { roof, ground }

enum PvOrientation { north, notNorth }

class SizingInput {
  final List<double> last6MonthsKwh;
  final double offsetPercent; // 0..100
  final String cityKey; // ej. 'LA PAZ'
  final MountType mountType;
  final PvOrientation orientation;

  final double pr; // Performance ratio (0.6-0.9)
  final double dcAcRatioTarget; // 1.05-1.40
  final bool allowBifacial;

  const SizingInput({
    required this.last6MonthsKwh,
    required this.offsetPercent,
    required this.cityKey,
    required this.mountType,
    required this.orientation,
    this.pr = 0.80,
    this.dcAcRatioTarget = 1.40,
    this.allowBifacial = true,
  });
}

class SizingResult {
  final double kwhAvg;
  final double kwhTarget;
  final double hspDesign;

  final double pdcRequiredKw;
  final int modulesQty;
  final double moduleWp;
  final double pdcRealKw;

  final double inverterAcKw;
  final String panelName;
  final String inverterName;

  final double capexBs;
  final double panelsCostBs;
  final double inverterCostBs;
  final double bosCostBs;

  // NUEVOS (opcional para mostrar conexión/strings)
  final String connection; // ej. "1Φ 220 V" o "3Φ 380/220 V"
  final String stringing; // ej. "2 strings × 7 módulos"

  const SizingResult({
    required this.kwhAvg,
    required this.kwhTarget,
    required this.hspDesign,
    required this.pdcRequiredKw,
    required this.modulesQty,
    required this.moduleWp,
    required this.pdcRealKw,
    required this.inverterAcKw,
    required this.panelName,
    required this.inverterName,
    required this.capexBs,
    required this.panelsCostBs,
    required this.inverterCostBs,
    required this.bosCostBs,
    this.connection = '',
    this.stringing = '',
  });

  // Getter útil para la UI
  double get dcAcRatio => inverterAcKw <= 0 ? 0.0 : (pdcRealKw / inverterAcKw);
}

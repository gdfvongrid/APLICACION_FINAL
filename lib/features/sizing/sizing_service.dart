import 'dart:math';

import '../catalog/catalog_repository.dart';
import 'hsp_data.dart';
import 'sizing_model.dart';

class SizingService {
  SizingResult size({
    required SizingInput input,
    required CatalogData catalog,
  }) {
    if (input.last6MonthsKwh.isEmpty) {
      throw ArgumentError('Debe ingresar consumos.');
    }

    final kwhAvg =
        input.last6MonthsKwh.reduce((a, b) => a + b) /
        input.last6MonthsKwh.length;
    final kwhTarget = kwhAvg * (input.offsetPercent / 100.0);

    final city = citiesHsp[normKey(input.cityKey)];
    if (city == null)
      throw StateError('Ciudad no encontrada: ${input.cityKey}');
    final hsp = city.hsp;

    // kWh/mes ≈ Pdc(kW) * HSP * PR * 30
    const days = 30.0;
    final pdcRequired = kwhTarget / (hsp * input.pr * days);

    // Selección panel: menor Bs/Wp (y bifacial si suelo)
    final panel = _pickPanel(catalog.paneles, input);

    final modulesQty = max(1, (pdcRequired * 1000.0 / panel.wp).ceil());
    final pdcReal = modulesQty * panel.wp / 1000.0;

    // Selección inversor: Pac ≈ PdcReal / DCAC
    final targetPacW = (pdcReal / input.dcAcRatioTarget) * 1000.0;
    final inv = _pickInverter(catalog.inversores, targetPacW);

    final inverterAcKw = inv.pacW / 1000.0;

    // Costos
    final panelsCost = modulesQty * panel.precioBs;
    final inverterCost = inv.precioBs;

    final bosPct = pdcReal <= 5 ? 0.30 : (pdcReal <= 20 ? 0.25 : 0.20);
    final bosCost = (panelsCost + inverterCost) * bosPct;

    final capex = panelsCost + inverterCost + bosCost;

    return SizingResult(
      kwhAvg: kwhAvg,
      kwhTarget: kwhTarget,
      hspDesign: hsp,
      pdcRequiredKw: pdcRequired,
      modulesQty: modulesQty,
      moduleWp: panel.wp,
      pdcRealKw: pdcReal,
      inverterAcKw: inverterAcKw,
      panelName: panel.nombre,
      inverterName: inv.nombre,
      capexBs: capex,
      panelsCostBs: panelsCost,
      inverterCostBs: inverterCost,
      bosCostBs: bosCost,
    );
  }

  PanelItem _pickPanel(List<PanelItem> panels, SizingInput input) {
    if (panels.isEmpty) throw StateError('Catálogo de paneles vacío.');

    if (input.mountType == MountType.ground && input.allowBifacial) {
      final bif = panels
          .where((p) => p.tipo.toUpperCase().contains('BIFAC'))
          .toList();
      if (bif.isNotEmpty) {
        return bif.reduce(
          (a, b) => (a.precioBs / a.wp) <= (b.precioBs / b.wp) ? a : b,
        );
      }
    }
    return panels.reduce(
      (a, b) => (a.precioBs / a.wp) <= (b.precioBs / b.wp) ? a : b,
    );
  }

  InverterItem _pickInverter(List<InverterItem> invs, double targetPacW) {
    if (invs.isEmpty) throw StateError('Catálogo de inversores vacío.');
    final sorted = invs.toList()..sort((a, b) => a.pacW.compareTo(b.pacW));
    for (final inv in sorted) {
      if (inv.pacW >= targetPacW) return inv;
    }
    return sorted.last;
  }
}

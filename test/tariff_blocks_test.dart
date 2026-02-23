import 'package:aplicacion_final/features/billing/tariff_blocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('computeEnergyCharge calcula bloques no-TOU', () {
    const blocks = [
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: 100,
        rateBsPerKwh: 1.0,
      ),
      EnergyBlock(
        startKwhExclusive: 100,
        endKwhInclusive: null,
        rateBsPerKwh: 2.0,
      ),
    ];

    final charge = computeEnergyCharge(150, blocks);

    expect(charge, 200.0);
  });

  test('computeEnergyCharge soporta TOU simple (un bloque por periodo)', () {
    const blocks = [
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: null,
        rateBsPerKwh: 1.0,
        tou: 'alto',
      ),
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: null,
        rateBsPerKwh: 0.5,
        tou: 'medio',
      ),
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: null,
        rateBsPerKwh: 0.25,
        tou: 'bajo',
      ),
    ];

    final charge = computeEnergyCharge(
      0,
      blocks,
      kwhAlto: 10,
      kwhMedio: 20,
      kwhBajo: 30,
    );

    expect(charge, 27.5);
  });

  test('computeEnergyCharge soporta TOU + bloques por periodo (CRE GD-BT)', () {
    const blocks = [
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: 20,
        rateBsPerKwh: 0.058,
        tou: 'alto',
      ),
      EnergyBlock(
        startKwhExclusive: 20,
        endKwhInclusive: 120,
        rateBsPerKwh: 0.621,
        tou: 'alto',
      ),
      EnergyBlock(
        startKwhExclusive: 120,
        endKwhInclusive: null,
        rateBsPerKwh: 0.666,
        tou: 'alto',
      ),
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: 20,
        rateBsPerKwh: 0.015,
        tou: 'medio',
      ),
      EnergyBlock(
        startKwhExclusive: 20,
        endKwhInclusive: 120,
        rateBsPerKwh: 0.269,
        tou: 'medio',
      ),
      EnergyBlock(
        startKwhExclusive: 120,
        endKwhInclusive: null,
        rateBsPerKwh: 0.286,
        tou: 'medio',
      ),
      EnergyBlock(
        startKwhExclusive: 0,
        endKwhInclusive: 20,
        rateBsPerKwh: 0.013,
        tou: 'bajo',
      ),
      EnergyBlock(
        startKwhExclusive: 20,
        endKwhInclusive: 120,
        rateBsPerKwh: 0.250,
        tou: 'bajo',
      ),
      EnergyBlock(
        startKwhExclusive: 120,
        endKwhInclusive: null,
        rateBsPerKwh: 0.263,
        tou: 'bajo',
      ),
    ];

    final charge = computeEnergyCharge(
      0,
      blocks,
      kwhAlto: 150,
      kwhMedio: 90,
      kwhBajo: 10,
    );

    // alto = 20*0.058 + 100*0.621 + 30*0.666 = 83.16
    // medio = 20*0.015 + 70*0.269 = 19.13
    // bajo = 10*0.013 = 0.13
    // total = 102.42
    expect(charge, closeTo(102.42, 1e-9));
  });
}

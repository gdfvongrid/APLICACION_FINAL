import 'billing_model.dart';
import 'tariff_blocks.dart';

/// Catálogo construido desde ET.xlsx (última columna disponible: ene-26 en el archivo).
/// Nota: la hoja ET_DLP está vacía en el archivo proporcionado, por eso DELAPAZ queda sin datos.
final Map<Distributor, Map<String, BlockTariff>> tariffCatalog = {
  Distributor.delapaz: {
    'D2-PD-BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.4649,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.806,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.823,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.856,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.963,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.365,
        ),
      ],
    ),
  },
  Distributor.endeDelbeni: {
    'Agua potable y alcantarillado': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.169,
        ),
      ],
    ),
    'Alumbrado público': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.527,
        ),
      ],
    ),
    'Comercialización VE Carga Lenta': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.782,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.134,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.97,
        ),
      ],
    ),
    'Comercialización VE Carga Rapida': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.056,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.408,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.246,
        ),
      ],
    ),
    'Comercialización VE Carga Semi Rápida': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.846,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.198,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.034,
        ),
      ],
    ),
    'Domiciliaria': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.6946,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.807,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.938,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.095,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.102,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.384,
        ),
      ],
    ),
    'Estaciones de Recarga VE-1(BT)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.574,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.944,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.788,
        ),
      ],
    ),
    'Estaciones de Recarga VE-2(MT)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.154,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.577,
        ),
      ],
    ),
    'General 1': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.71035,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 1.464,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: null,
          rateBsPerKwh: 1.537,
        ),
      ],
    ),
    'General 1 SFL': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.71035,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 1.464,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: null,
          rateBsPerKwh: 1.537,
        ),
      ],
    ),
    'General 2': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 2.1003,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 1.94,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 1.989,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 2.127,
        ),
      ],
    ),
    'General 2 SFL': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 2.1003,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 1.94,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 1.989,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 2.127,
        ),
      ],
    ),
    'Industrial 1': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.89646,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: null,
          rateBsPerKwh: 0.932,
        ),
      ],
    ),
    'Industrial 2': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.897,
        ),
      ],
    ),
    'Prepago Domiciliario': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.038,
        ),
      ],
    ),
    'Prepago General': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.261,
        ),
      ],
    ),
    'Seguridad Ciudadana': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.71035,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.827,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.958,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 1.151,
        ),
      ],
    ),
  },
  Distributor.cre: {
    'Alumbrado Publico Menor y Mayor PD BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.302,
        ),
      ],
    ),

    'Agua Potable GD BT': BlockTariff(
      fixedChargeBs: 30.686,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.54,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.437,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.35,
        ),
      ],
    ),
    'Agua Potable GD MT': BlockTariff(
      fixedChargeBs: 30.686,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.269,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.421,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.333,
        ),
      ],
    ),
    'Agua Potable GD MT SR': BlockTariff(
      fixedChargeBs: 38.481,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.044,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.015,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.014,
        ),
      ],
    ),
    'Agua Potable MD BT': BlockTariff(
      fixedChargeBs: 15.342,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.49,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 52.131,
        ),
      ],
    ),
    'Agua Potable MD MT': BlockTariff(
      fixedChargeBs: 15.342,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.476,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 51.854,
        ),
      ],
    ),
    'Agua Potable PD BT': BlockTariff(
      fixedChargeBs: 12.734,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.745,
        ),
      ],
    ),
    'Agua Potable PD MT': BlockTariff(
      fixedChargeBs: 12.734,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.731,
        ),
      ],
    ),
    'Alta Tensión GD': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.65,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.35,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.325,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.54,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.293,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.274,
        ),
      ],
    ),
    'Autoproductores GD BT': BlockTariff(
      fixedChargeBs: 164.262,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.264,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.155,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.152,
        ),
      ],
    ),
    'Autoproductores GD MT': BlockTariff(
      fixedChargeBs: 164.262,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.242,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.143,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.14,
        ),
      ],
    ),
    'Autoproductores MD BT': BlockTariff(
      fixedChargeBs: 88.449,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.195,
        ),
      ],
    ),
    'Autoproductores MD MT': BlockTariff(
      fixedChargeBs: 88.449,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.177,
        ),
      ],
    ),
    'Domiciliaria GD BT': BlockTariff(
      fixedChargeBs: 38.487,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.058,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.013,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.621,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.269,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.25,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.666,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.286,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.263,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.726,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.308,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.286,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.729,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.309,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.287,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.908,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.386,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.358,
        ),
      ],
    ),
    'Domiciliaria GD T3': BlockTariff(
      fixedChargeBs: 38.487,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.05,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.016,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.636,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.294,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.279,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.681,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.312,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.292,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.735,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.34,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.319,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.738,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.341,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.32,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.92,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.425,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.399,
        ),
      ],
    ),
    'Domiciliaria MD MT': BlockTariff(
      fixedChargeBs: 34.544,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.037,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.465,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.497,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.54,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.542,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.676,
        ),
      ],
    ),
    'Domiciliario-MD BT': BlockTariff(
      fixedChargeBs: 34.544,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.041,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.449,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.477,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.519,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.521,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.649,
        ),
      ],
    ),
    'Domiciliario-PD BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 15,
          rateBsPerKwh: 1.020933,
        ),
        EnergyBlock(
          startKwhExclusive: 16,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.846,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.081,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.138,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.142,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.424,
        ),
      ],
    ),
    'Domiciliario-PD MT': BlockTariff(
      fixedChargeBs: 29.07,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.137,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.74,
        ),
        EnergyBlock(
          startKwhExclusive: 101,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.799,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.903,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.975,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.978,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.22,
        ),
      ],
    ),

    'General  PD BT SR': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 15,
          rateBsPerKwh: 1.7436,
        ),
        EnergyBlock(
          startKwhExclusive: 16,
          endKwhInclusive: 600,
          rateBsPerKwh: 1.552,
        ),
        EnergyBlock(
          startKwhExclusive: 600,
          endKwhInclusive: null,
          rateBsPerKwh: 1.46,
        ),
      ],
    ),
    'General 1 GD BT': BlockTariff(
      fixedChargeBs: 37.314,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.076,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.016,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.09,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.422,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.388,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.827,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.674,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.623,
        ),
      ],
    ),
    'General 1 GD MT': BlockTariff(
      fixedChargeBs: 37.314,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.057,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.016,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.102,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.417,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.39,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.841,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.668,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.623,
        ),
      ],
    ),
    'General 1 MD BT': BlockTariff(
      fixedChargeBs: 31.048,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.043,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.684,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.119,
        ),
      ],
    ),
    'General 1 MD MT': BlockTariff(
      fixedChargeBs: 31.048,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.037,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.681,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.111,
        ),
      ],
    ),
    'General 1 PD BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.3077,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.166,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.711,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.549,
        ),
      ],
    ),
    'General 1 PD MT': BlockTariff(
      fixedChargeBs: 26.153,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.179,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.115,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.688,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.52,
        ),
      ],
    ),
    'General 2 GD BT': BlockTariff(
      fixedChargeBs: 48.274,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.072,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.019,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.018,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.305,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.695,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.641,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 2.038,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.067,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.987,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 1.69,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.892,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.825,
        ),
      ],
    ),
    'General 2 GD MT': BlockTariff(
      fixedChargeBs: 48.274,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.055,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.019,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.018,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.305,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.686,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.642,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 2.038,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.057,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.99,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 1.693,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.882,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.825,
        ),
      ],
    ),
    'General 2 MD BT': BlockTariff(
      fixedChargeBs: 41.319,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.047,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.977,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.522,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 1.262,
        ),
      ],
    ),
    'General 2 MD MT': BlockTariff(
      fixedChargeBs: 41.319,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.037,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.945,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.483,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 1.231,
        ),
      ],
    ),
    'General 2 PD BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.8211,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.524,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 1000,
          rateBsPerKwh: 2.001,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.703,
        ),
      ],
    ),
    'General 2 PD MT': BlockTariff(
      fixedChargeBs: 36.424,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.202,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.337,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.974,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.667,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.501,
        ),
      ],
    ),
    'Granjeros GD BT': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.626,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.467,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.457,
        ),
      ],
    ),
    'Granjeros GD MT': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.597,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.448,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.437,
        ),
      ],
    ),
    'Granjeros MD BT': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.49,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.562,
        ),
      ],
    ),
    'Granjeros MD MT': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.469,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.545,
        ),
      ],
    ),
    'Granjeros PD BT': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.989,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: null,
          rateBsPerKwh: 1.018,
        ),
      ],
    ),
    'Granjeros PD MT': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.607,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: null,
          rateBsPerKwh: 1.048,
        ),
      ],
    ),
    'Industrial 1 GD BT SR': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.563,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.311,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.286,
        ),
      ],
    ),
    'Industrial 1 GD MT SR': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.482,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.305,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.286,
        ),
      ],
    ),
    'Industrial 1 MD BT': BlockTariff(
      fixedChargeBs: 11.914,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.32,
        ),
      ],
    ),
    'Industrial 1 MD MT': BlockTariff(
      fixedChargeBs: 11.914,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.292,
        ),
      ],
    ),
    'Industrial 1 PD BT': BlockTariff(
      fixedChargeBs: 7.019,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.828,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.706,
        ),
      ],
    ),
    'Industrial 1 PD MT': BlockTariff(
      fixedChargeBs: 7.019,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.745,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.626,
        ),
      ],
    ),
    'Industrial 2 GD BT': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.629,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.318,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.295,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.523,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.267,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.248,
        ),
      ],
    ),
    'Industrial 2 GD BT SR': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.683,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.318,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.295,
        ),
      ],
    ),
    'Industrial 2 GD MT': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.633,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.314,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.295,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.525,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.264,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.248,
        ),
      ],
    ),
    'Industrial 2 GD MT SR': BlockTariff(
      fixedChargeBs: 19.884,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.633,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.314,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.295,
        ),
      ],
    ),
    'Prepago domiciliario PD BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.948,
        ),
      ],
    ),
    'Prepago General PD BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.035,
        ),
      ],
    ),
    'Seguridad ciudadana': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 15,
          rateBsPerKwh: 0.845867,
        ),
        EnergyBlock(
          startKwhExclusive: 16,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.846,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.081,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.138,
        ),
      ],
    ),
  },
  Distributor.cessa: {
    'Agua potable': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.9724,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.759,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: null,
          rateBsPerKwh: 1.021,
        ),
      ],
    ),
    'Alumbrado público Mayor': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.236,
        ),
      ],
    ),
    'Alumbrado público menor': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.13,
        ),
      ],
    ),
    'Bombas de riego': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.9824,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.761,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: null,
          rateBsPerKwh: 1.012,
        ),
      ],
    ),
    'Cementeras': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.66,
        ),
      ],
    ),
    'Comercial 1': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.2846,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.231,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.395,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 2.05,
        ),
      ],
    ),
    'Comercial 2': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 40,
          rateBsPerKwh: 1.74215,
        ),
        EnergyBlock(
          startKwhExclusive: 41,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.225,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.271,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.963,
        ),
      ],
    ),
    'Comercial 3': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 40,
          rateBsPerKwh: 1.74215,
        ),
        EnergyBlock(
          startKwhExclusive: 41,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.225,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.271,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.963,
        ),
      ],
    ),
    'Domiciliaria': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.9824,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 70,
          rateBsPerKwh: 0.768,
        ),
        EnergyBlock(
          startKwhExclusive: 71,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.881,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.031,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.197,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.436,
        ),
      ],
    ),
    'Estaciones de recarga VE-1 (BT)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.933,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.159,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.967,
        ),
      ],
    ),
    'Estaciones de recarga VE-2 (MT)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.418,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.851,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.708,
        ),
      ],
    ),
    'General 1': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.2846,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.231,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.395,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 2.05,
        ),
      ],
    ),
    'General 2': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 3.4843,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.225,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.271,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.963,
        ),
      ],
    ),
    'General 3': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.2846,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.231,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.395,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 2.05,
        ),
      ],
    ),
    'General 4': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 40,
          rateBsPerKwh: 1.74215,
        ),
        EnergyBlock(
          startKwhExclusive: 41,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.225,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.271,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.963,
        ),
      ],
    ),
    'Industrial 1': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.2846,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.162,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.317,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.88,
        ),
      ],
    ),
    'Industrial 2': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.586,
        ),
      ],
    ),
    'Seguridad ciudadana': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.9726,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 70,
          rateBsPerKwh: 0.761,
        ),
        EnergyBlock(
          startKwhExclusive: 71,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.872,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: null,
          rateBsPerKwh: 1.021,
        ),
      ],
    ),
    'Comercialización (Carga Lenta)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.188,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.391,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.192,
        ),
      ],
    ),
    'Comercialización (Carga Rapida)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.525,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.728,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.529,
        ),
      ],
    ),
    'Comercialización (Carga Semi Rápida)': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.267,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.47,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.271,
        ),
      ],
    ),
  },
  Distributor.elfec: {
    'Agro MDBT': BlockTariff(
      fixedChargeBs: 12.52,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.401,
        ),
      ],
    ),
    'Agro MDMT': BlockTariff(
      fixedChargeBs: 12.52,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.401,
        ),
      ],
    ),
    'Agro PDBT': BlockTariff(
      fixedChargeBs: 19.346,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.419,
        ),
      ],
    ),
    'Agro PDMT': BlockTariff(
      fixedChargeBs: 19.346,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.419,
        ),
      ],
    ),
    'Agua potable PDBT': BlockTariff(
      fixedChargeBs: 18.885,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.505,
        ),
      ],
    ),
    'Agua potable GDBT': BlockTariff(
      fixedChargeBs: 18.411,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.653,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.581,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.518,
        ),
      ],
    ),
    'Agua potable GDMT': BlockTariff(
      fixedChargeBs: 18.411,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.618,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.547,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.488,
        ),
      ],
    ),
    'Agua potable MDBT': BlockTariff(
      fixedChargeBs: 18.411,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.563,
        ),
      ],
    ),
    'Agua potable MDMT': BlockTariff(
      fixedChargeBs: 18.411,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.514,
        ),
      ],
    ),
    'Agua potable 2 PDBT': BlockTariff(
      fixedChargeBs: 17.751,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.868,
        ),
      ],
    ),
    'Agua potable PDMT': BlockTariff(
      fixedChargeBs: 17.751,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.844,
        ),
      ],
    ),
    'Alumbrado público 1 PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.153,
        ),
      ],
    ),
    'Alumbrado público 2 PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.038,
        ),
      ],
    ),
    'Comercial GDBT': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.307,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.171,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.051,
        ),
      ],
    ),
    'Comercial GDMT': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.294,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.176,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.054,
        ),
      ],
    ),
    'Comercial MDBT': BlockTariff(
      fixedChargeBs: 12.333,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.943,
        ),
      ],
    ),
    'Comercial MDMT': BlockTariff(
      fixedChargeBs: 12.333,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.939,
        ),
      ],
    ),
    'Comercial PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.48115,
        ),
        EnergyBlock(
          startKwhExclusive: 12,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.93,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.748,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.268,
        ),
      ],
    ),
    'Comercial PDMT': BlockTariff(
      fixedChargeBs: 29.435,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: -20,
          rateBsPerKwh: 0.302,
        ),
        EnergyBlock(
          startKwhExclusive: 12,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.915,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.584,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.313,
        ),
      ],
    ),
    'Domiciliaria EXELEPSA PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.9834,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.715,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.722,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.961,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.966,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 0,
          rateBsPerKwh: 0.966,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.966,
        ),
      ],
    ),
    'Domiciliaria MDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.4006,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.448,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.628,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.718,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.724,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.89,
        ),
      ],
    ),
    'Domiciliaria MDMT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.39925,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.447,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.626,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.713,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.719,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.884,
        ),
      ],
    ),
    'Domiciliaria PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.2101,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.88,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.89,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.182,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.189,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.199,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.474,
        ),
      ],
    ),
    'Domiciliaria PDMT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.2472,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.795,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.113,
        ),
        EnergyBlock(
          startKwhExclusive: 301,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.127,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.136,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.396,
        ),
      ],
    ),
    'Escenarios deportivos GDMT': BlockTariff(
      fixedChargeBs: 17.751,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.284,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.074,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.856,
        ),
      ],
    ),
    'Escenarios deportivos MDBT': BlockTariff(
      fixedChargeBs: 11.891,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.932,
        ),
      ],
    ),
    'Escenarios deportivos MDMT': BlockTariff(
      fixedChargeBs: 11.891,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.931,
        ),
      ],
    ),
    'Estación de recarga GDMT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.389,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.833,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
        ),
      ],
    ),
    'Estación de recarga MDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.893,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.135,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.946,
        ),
      ],
    ),
    'Estación de recarga MDMT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.389,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.833,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
        ),
      ],
    ),
    'Estación de recarga PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.893,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.135,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.946,
        ),
      ],
    ),
    'Estación de recarga PDMT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.389,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.833,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
        ),
      ],
    ),
    'General PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.57585,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.017,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.122,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.349,
        ),
      ],
    ),
    'General GDBT': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.307,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.171,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.051,
        ),
      ],
    ),
    'General GDMT': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.294,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.176,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.054,
        ),
      ],
    ),
    'General MDBT': BlockTariff(
      fixedChargeBs: 12.333,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.943,
        ),
      ],
    ),
    'General MDMT': BlockTariff(
      fixedChargeBs: 12.333,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.939,
        ),
      ],
    ),
    'Generall PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.48115,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.748,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.93,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.268,
        ),
      ],
    ),
    'General PDMT': BlockTariff(
      fixedChargeBs: 29.435,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.302,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.584,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.915,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.313,
        ),
      ],
    ),
    'General(SFL) GDBT': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.307,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.171,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.051,
        ),
      ],
    ),
    'General(SFL) GDMT': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.294,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.176,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.054,
        ),
      ],
    ),
    'General(SFL) MDBT': BlockTariff(
      fixedChargeBs: 12.333,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.943,
        ),
      ],
    ),
    'General(SFL) MDMT': BlockTariff(
      fixedChargeBs: 12.333,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.939,
        ),
      ],
    ),
    'General(SFL) PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.48115,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.748,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.93,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.268,
        ),
      ],
    ),
    'General(SFL) PDMT': BlockTariff(
      fixedChargeBs: 29.435,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.302,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.584,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.915,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 1.313,
        ),
      ],
    ),
    'Industrial GDBT': BlockTariff(
      fixedChargeBs: 23.873,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.625,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.564,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.488,
        ),
      ],
    ),
    'Industrial GDMT': BlockTariff(
      fixedChargeBs: 23.873,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.611,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.547,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.477,
        ),
      ],
    ),
    'Industrial GDST': BlockTariff(
      fixedChargeBs: 23.873,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.526,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.459,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.413,
        ),
      ],
    ),
    'Industrial MDBT': BlockTariff(
      fixedChargeBs: 12.807,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.434,
        ),
      ],
    ),
    'Industrial MDMT': BlockTariff(
      fixedChargeBs: 12.807,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.434,
        ),
      ],
    ),
    'Industrial PDBT': BlockTariff(
      fixedChargeBs: 25.278,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.094,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 0.592,
        ),
      ],
    ),
    'Industrial PDMT': BlockTariff(
      fixedChargeBs: 25.278,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 700,
          rateBsPerKwh: 1.006,
        ),
        EnergyBlock(
          startKwhExclusive: 700,
          endKwhInclusive: null,
          rateBsPerKwh: 0.596,
        ),
      ],
    ),
    'Seguridad ciudadana PDBT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 1.25065,
        ),
        EnergyBlock(
          startKwhExclusive: 12,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.196,
        ),
        EnergyBlock(
          startKwhExclusive: 21,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.966,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.215,
        ),
      ],
    ),
    'Transporte eléctrico GDMT': BlockTariff(
      fixedChargeBs: 18.922,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.868,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.795,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.719,
        ),
      ],
    ),
    'Transporte eléctrico MDBT': BlockTariff(
      fixedChargeBs: 12.675,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.701,
        ),
      ],
    ),
    'Transporte eléctrico MDMT': BlockTariff(
      fixedChargeBs: 12.675,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.701,
        ),
      ],
    ),
    'Comercializacion Estaciones de Recarga Lento': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.142,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.363,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.168,
        ),
      ],
    ),
    'Comercializacion Estaciones de Recarga Rápida': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.473,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.693,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.497,
        ),
      ],
    ),
    'Comercializacion Estaciones de Recarga Semirápida': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.221,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.44,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.244,
        ),
      ],
    ),
  },
  Distributor.endeDeoruro: {
    'AP_PD-AP-BT-1': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.355,
        ),
      ],
    ),
    'AP_PD-AP-BT-2': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.155,
        ),
      ],
    ),
    'Agua GD BT': BlockTariff(
      fixedChargeBs: 34.782,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.826,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.8,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.735,
        ),
      ],
    ),
    'C_GD-MT': BlockTariff(
      fixedChargeBs: 34.782,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.841,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.816,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.749,
        ),
      ],
    ),
    'C_MD-BT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.759,
        ),
      ],
    ),
    'C_MD-MT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.755,
        ),
      ],
    ),
    'C_PD-BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 31,
          endKwhInclusive: 50,
          rateBsPerKwh: 1.311,
        ),
        EnergyBlock(
          startKwhExclusive: 51,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.49,
        ),
        EnergyBlock(
          startKwhExclusive: 121,
          endKwhInclusive: null,
          rateBsPerKwh: 1.493,
        ),
      ],
    ),
    'C_PD-MT': BlockTariff(
      fixedChargeBs: 33.085,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.812,
        ),
      ],
    ),
    'Domiciliario': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 15,
          rateBsPerKwh: 1.915333,
        ),
        EnergyBlock(
          startKwhExclusive: 16,
          endKwhInclusive: 70,
          rateBsPerKwh: 0.84,
        ),
        EnergyBlock(
          startKwhExclusive: 71,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.861,
        ),
        EnergyBlock(
          startKwhExclusive: 201,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.919,
        ),
        EnergyBlock(
          startKwhExclusive: 501,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.104,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.482,
        ),
      ],
    ),
    'E_GD-AT': BlockTariff(
      fixedChargeBs: 499.462,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.433,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.416,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.404,
        ),
      ],
    ),
    'E_MD-BT': BlockTariff(
      fixedChargeBs: 34.15,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 0.551,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 0.627,
        ),
      ],
    ),
    'G1_PD-G-BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 30,
          rateBsPerKwh: 1.29,
        ),
        EnergyBlock(
          startKwhExclusive: 31,
          endKwhInclusive: 50,
          rateBsPerKwh: 1.314,
        ),
        EnergyBlock(
          startKwhExclusive: 51,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.494,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: null,
          rateBsPerKwh: 1.498,
        ),
      ],
    ),
    'G1_SFL_PD-G-BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 30,
          rateBsPerKwh: 1.29,
        ),
        EnergyBlock(
          startKwhExclusive: 31,
          endKwhInclusive: 50,
          rateBsPerKwh: 1.314,
        ),
        EnergyBlock(
          startKwhExclusive: 51,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.494,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: null,
          rateBsPerKwh: 1.498,
        ),
      ],
    ),
    'G2_MD-BT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.759,
        ),
      ],
    ),
    'G2_MD-MT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.755,
        ),
      ],
    ),
    'G2_PD-G-BT': BlockTariff(
      fixedChargeBs: 33.136,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 1.295,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 1.427,
        ),
      ],
    ),
    'G2_SFL_GD-MT': BlockTariff(
      fixedChargeBs: 34.782,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.841,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.816,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.749,
        ),
      ],
    ),
    'G2_SFL_MD-BT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.759,
        ),
      ],
    ),
    'G2_SFL_MD-MT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.755,
        ),
      ],
    ),
    'G2_SFL_PD-G-BT': BlockTariff(
      fixedChargeBs: 33.136,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 1.295,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 1.427,
        ),
      ],
    ),
    'GD-AG-MT': BlockTariff(
      fixedChargeBs: 34.782,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.786,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.763,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.7,
        ),
      ],
    ),
    'G_PD-G-MT': BlockTariff(
      fixedChargeBs: 33.085,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.762,
        ),
      ],
    ),
    'G_SFL_PD-G-MT': BlockTariff(
      fixedChargeBs: 33.085,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.762,
        ),
      ],
    ),
    'General Mayor G2 GD MT': BlockTariff(
      fixedChargeBs: 34.782,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.841,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.816,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.749,
        ),
      ],
    ),
    'IND MAYOR E_GD-BT': BlockTariff(
      fixedChargeBs: 42.954,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.502,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.48,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.443,
        ),
      ],
    ),
    'IND MAYOR E_GD-MT': BlockTariff(
      fixedChargeBs: 42.954,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.48,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.459,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.429,
        ),
      ],
    ),
    'IND MAYOR E_MD-MT': BlockTariff(
      fixedChargeBs: 34.15,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 0.337,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 0.383,
        ),
      ],
    ),
    'IND MAYOR E_PD-G-MT': BlockTariff(
      fixedChargeBs: 33.134,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 1.072,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 1.103,
        ),
      ],
    ),
    'IND MENOR D_MD-MT': BlockTariff(
      fixedChargeBs: 34.15,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.341,
        ),
      ],
    ),
    'IND MENOR D_PD-G-BT': BlockTariff(
      fixedChargeBs: 33.134,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.859,
        ),
      ],
    ),
    'MD-AG-BT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.71,
        ),
      ],
    ),
    'MD-AG-MT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.706,
        ),
      ],
    ),
    'MINERIA M_MD-MT': BlockTariff(
      fixedChargeBs: 34.15,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.24,
        ),
      ],
    ),
    'M_GD-AT': BlockTariff(
      fixedChargeBs: 499.462,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.433,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.416,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.404,
        ),
      ],
    ),
    'M_GD-MT': BlockTariff(
      fixedChargeBs: 42.954,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.289,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.276,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.251,
        ),
      ],
    ),
    'M_PD-G-BT': BlockTariff(
      fixedChargeBs: 33.134,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.666,
        ),
      ],
    ),
    'OD_GD-MT': BlockTariff(
      fixedChargeBs: 32.953,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.301,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.287,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.263,
        ),
      ],
    ),
    'OD_PD-MT': BlockTariff(
      fixedChargeBs: 33.085,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.826,
        ),
      ],
    ),
    'OTRAS DISTRIB OD_MD-MT': BlockTariff(
      fixedChargeBs: 34.099,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.438,
        ),
      ],
    ),
    'PD-AG-BT': BlockTariff(
      fixedChargeBs: 33.136,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 1.212,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 1.333,
        ),
      ],
    ),
    'PD-AG-MT': BlockTariff(
      fixedChargeBs: 33.085,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.712,
        ),
      ],
    ),
    'PUEBLOS P_MD-MT': BlockTariff(
      fixedChargeBs: 34,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.292,
        ),
      ],
    ),
    'P_GD-MT': BlockTariff(
      fixedChargeBs: 34.02,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.302,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.286,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.262,
        ),
      ],
    ),
    'P_PD-R-MT': BlockTariff(
      fixedChargeBs: 32.988,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.662,
        ),
      ],
    ),
    'SC_PD-P-BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 15,
          rateBsPerKwh: 2.205667,
        ),
        EnergyBlock(
          startKwhExclusive: 12,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.892,
        ),
        EnergyBlock(
          startKwhExclusive: 16,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.843,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.984,
        ),
      ],
    ),
  },
};

List<String> categoriesFor(Distributor dist) {
  final m = tariffCatalog[dist];
  if (m == null) return const [];
  final cats = m.keys.toList()..sort();
  return cats;
}

BlockTariff tariffFor(Distributor dist, String category) {
  final t = tariffCatalog[dist]?[category];
  if (t == null) {
    throw StateError('No hay tarifa para $dist / $category');
  }
  return t;
}

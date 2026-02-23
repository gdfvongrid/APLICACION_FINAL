import 'billing_model.dart';
import 'tariff_blocks.dart';

/// Catálogo construido desde ET.xlsx (última columna disponible: ene-26 en el archivo).
/// Nota: la hoja ET_DLP está vacía en el archivo proporcionado, por eso DELAPAZ queda sin datos.
final Map<Distributor, Map<String, BlockTariff>> tariffCatalog = {
  Distributor.delapaz: {
    'D2-PD-BT': BlockTariff(
      fixedChargeBs: 29.298,
      blocks: const [
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
    'D3-PD-BT': BlockTariff(
      fixedChargeBs: 29.298,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.823,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.930,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.968,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.096,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.551,
        ),
      ],
    ),
    'D4-PD-BT': BlockTariff(
      fixedChargeBs: 29.298,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.823,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.984,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.022,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.144,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.620,
        ),
      ],
    ),
    'D5-PD-BT': BlockTariff(
      fixedChargeBs: 77.032,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.814,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.896,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.986,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.180,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.672,
        ),
      ],
    ),
    'D2-PD-MT': BlockTariff(
      fixedChargeBs: 29.298,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.727,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.698,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.784,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.952,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.344,
        ),
      ],
    ),
    'D5-PD-MT': BlockTariff(
      fixedChargeBs: 77.032,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.778,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.855,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.939,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 1.121,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.591,
        ),
      ],
    ),

    // ---------------- D5 GD BT ----------------
    'D5-GD-BT': BlockTariff(
      fixedChargeBs: 131.273,
      blocks: const [
        // 0 – 500
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.873,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.772,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.656,
          tou: 'bajo',
        ),

        // 501 – 1000
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.938,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.830,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.706,
          tou: 'bajo',
        ),

        // Excedente >1000
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.419,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.263,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.062,
          tou: 'bajo',
        ),
      ],
    ),
    // ---------------- D5 GD MT ----------------
    'D5-GD-MT': BlockTariff(
      fixedChargeBs: 131.273,
      blocks: const [
        // 0 – 500
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.856,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.754,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.644,
          tou: 'bajo',
        ),

        // 501 – 1000
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.920,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.811,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.693,
          tou: 'bajo',
        ),

        // Excedente >1000
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.412,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.237,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.053,
          tou: 'bajo',
        ),
      ],
    ),

    // ----------- D5 MD BT -----------
    'D5-MD-BT': BlockTariff(
      fixedChargeBs: 116.292,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.499,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.750,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.914,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.295,
        ),
      ],
    ),

    // ----------- D5 MD MT -----------
    'D5-MD-MT': BlockTariff(
      fixedChargeBs: 127.795,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.478,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.664,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.889,
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 1.259,
        ),
      ],
    ),
    'G-PD-BT': BlockTariff(
      fixedChargeBs: 40.583,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 30,
          endKwhInclusive: 100,
          rateBsPerKwh: 1.131,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 1.355,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 1.414,
        ),
      ],
    ),
    'G-PD-MT': BlockTariff(
      fixedChargeBs: 40.583,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.721,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.101,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.347,
        ),
      ],
    ),

    // Ignorando cargos por potencia (Cargo por Potencia y Exceso de Potencia Fuera de Punta)
    'G-GD-AT': BlockTariff(
      fixedChargeBs: 547.154,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.797,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.771,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.764,
          tou: 'bajo',
        ),
      ],
    ),

    'G-GD-BT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.557,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.402,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.129,
          tou: 'bajo',
        ),
      ],
    ),

    'G-GD-MT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.523,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.372,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.104,
          tou: 'bajo',
        ),
      ],
    ),

    'G-MD-BT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.155, // Cargo por Energía
        ),
      ],
    ),

    'G-MD-MT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.126, // Cargo por Energía
        ),
      ],
    ),
    'G1-MD-BT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.915,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.123,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.155,
        ),
      ],
    ),

    'G1-MD-MT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.915,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.123,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.133,
        ),
      ],
    ),

    // ---------------- G2 GD (TOU) ----------------
    'G2-GD-BT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.557,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.402,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.129,
          tou: 'bajo',
        ),
      ],
    ),

    'G2-GD-MT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.523,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.372,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.104,
          tou: 'bajo',
        ),
      ],
    ),

    // ---------------- G2 MD ----------------
    'G2-MD-BT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.155,
        ),
      ],
    ),

    'G2-MD-MT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.126,
        ),
      ],
    ),

    'G2-PD-BT': BlockTariff(
      fixedChargeBs: 40.583,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 30,
          endKwhInclusive: 100,
          rateBsPerKwh: 1.131,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 1.355,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 1.414,
        ),
      ],
    ),

    'G2-PD-MT': BlockTariff(
      fixedChargeBs: 40.583,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.721,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.101,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.347,
        ),
      ],
    ),

    'I-GD-AT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.611,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.576,
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.551,
        ),
      ],
    ),
    'I-GD-BT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.743,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.607,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.488,
          tou: 'bajo',
        ),
      ],
    ),

    'I-GD-MT': BlockTariff(
      fixedChargeBs: 691.554,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.717,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.582,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.470,
          tou: 'bajo',
        ),
      ],
    ),
    'I-MD-BT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.567, // Cargo por Energía
        ),
      ],
    ),

    'I-MD-MT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.502, // Cargo por Energía
        ),
      ],
    ),
    'I-PD-BT': BlockTariff(
      fixedChargeBs: 16.596,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 0.440,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 0.701,
        ),
      ],
    ),
    'I-PD-MT': BlockTariff(
      fixedChargeBs: 29.871,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 0.344,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 0.649,
        ),
      ],
    ),
    'MI-PD-BT': BlockTariff(
      fixedChargeBs: 29.871,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.919,
        ),
      ],
    ),

    // ---------------- MI GD BT ----------------
    'MI-GD-BT': BlockTariff(
      fixedChargeBs: 576.597,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.970,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.894,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.829,
          tou: 'bajo',
        ),
      ],
    ),

    // ---------------- MI GD MT ----------------
    'MI-GD-MT': BlockTariff(
      fixedChargeBs: 576.597,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.836,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.771,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.715,
          tou: 'bajo',
        ),
      ],
    ),

    // ---------------- MI MD BT ----------------
    'MI-MD-BT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.778,
        ),
      ],
    ),

    // ---------------- MI MD MT ----------------
    'MI-MD-MT': BlockTariff(
      fixedChargeBs: 66.383,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.708,
        ),
      ],
    ),

    'MI-PD-MT': BlockTariff(
      fixedChargeBs: 29.871,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 250,
          rateBsPerKwh: 0.631,
        ),
        EnergyBlock(
          startKwhExclusive: 250,
          endKwhInclusive: null,
          rateBsPerKwh: 0.948,
        ),
      ],
    ),
    'AG-PD-BT': BlockTariff(
      fixedChargeBs: 40.583,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 30,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.697,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.772,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.807,
        ),
      ],
    ),
    'AG-PD-MT': BlockTariff(
      fixedChargeBs: 40.583,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.411,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.681,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.769,
        ),
      ],
    ),
    'RECARGA VEHÍCULOS ELÉCTRICOS BT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.867,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.119,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.934,
          tou: 'bajo',
        ),
      ],
    ),

    // ---------------- RECARGA VEHÍCULOS ELÉCTRICOS MT ----------------
    'RECARGA VEHÍCULOS ELÉCTRICOS MT': BlockTariff(
      fixedChargeBs: 0,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.368,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.821,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.685,
          tou: 'bajo',
        ),
      ],
    ),

    // ---------------- SC ----------------
    // Cargo mínimo 29.298 (cubre hasta 20 kWh)
    'SC': BlockTariff(
      fixedChargeBs: 29.298,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 50,
          rateBsPerKwh: 0.765,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.781,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.813,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.843,
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
    'Domiciliaria': BlockTariff(
      fixedChargeBs: 13.892,
      blocks: const [
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
    'General 1 y General SFL 1': BlockTariff(
      fixedChargeBs: 14.207,
      blocks: const [
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
    'General 2 y General SFL 2': BlockTariff(
      fixedChargeBs: 42.006,
      blocks: const [
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
      fixedChargeBs: 44.823,
      blocks: const [
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
      fixedChargeBs: 14.207,
      blocks: const [
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
    'Agua Potable MD BT (No calcula potencia :) )': BlockTariff(
      fixedChargeBs: 15.342,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.49,
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
    'Domiciliaria GD BT': BlockTariff(
      fixedChargeBs: 38.487,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.058,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
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
          rateBsPerKwh: 0.621,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.269,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.25,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.666,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.286,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.263,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.726,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.308,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.286,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.729,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.309,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.287,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.908,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.386,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.358,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.016,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.636,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.294,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.279,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.681,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.312,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.292,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.735,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.34,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.319,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.738,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.341,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: 1000,
          rateBsPerKwh: 0.32,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.92,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.425,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 1000,
          endKwhInclusive: null,
          rateBsPerKwh: 0.399,
          tou: 'bajo',
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
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.465,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.497,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.54,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.449,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.477,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.519,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
      fixedChargeBs: 15.314,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 15,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.846,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.081,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.138,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
          startKwhExclusive: 20,
          endKwhInclusive: 100,
          rateBsPerKwh: 0.74,
        ),
        EnergyBlock(
          startKwhExclusive: 100,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.799,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.903,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.975,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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

    'General PD BT SR': BlockTariff(
      fixedChargeBs: 26.154,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 15,
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.016,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.09,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.422,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.388,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.827,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.674,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.623,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.016,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.015,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.102,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.417,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.39,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.841,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.668,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 0.623,
          tou: 'bajo',
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
          startKwhExclusive: 20,
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
          startKwhExclusive: 20,
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
      fixedChargeBs: 26.154,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.166,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
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
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.115,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.019,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.018,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.305,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.695,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.641,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 2.038,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.067,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.987,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 1.69,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.892,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.825,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.019,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.018,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.305,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.686,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.642,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 2.038,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.057,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.99,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 1.693,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.882,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 500,
          endKwhInclusive: null,
          rateBsPerKwh: 0.825,
          tou: 'bajo',
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
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.977,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
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
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.945,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
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
      fixedChargeBs: 36.422,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.524,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
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
          startKwhExclusive: 20,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.337,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.974,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
    'Granjeros GD BT (no calcula potencia)': BlockTariff(
      fixedChargeBs: 53.702,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.626,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.467,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.457,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.448,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.437,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.311,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.286,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.305,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.286,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.318,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.295,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.523,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.267,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.248,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.318,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.295,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.314,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.295,
          tou: 'bajo',
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.525,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.264,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: null,
          rateBsPerKwh: 0.248,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.314,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.295,
          tou: 'bajo',
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
      fixedChargeBs: 12.688,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 15,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.846,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
      fixedChargeBs: 19.448,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
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
    'Alumbrado público Menor': BlockTariff(
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
      fixedChargeBs: 19.648,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
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

    'Comercial 1': BlockTariff(
      fixedChargeBs: 25.692,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.231,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'Comercial 2 y 3': BlockTariff(
      fixedChargeBs: 69.686,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 40,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.225,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
      fixedChargeBs: 19.648,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 70,
          rateBsPerKwh: 0.768,
        ),
        EnergyBlock(
          startKwhExclusive: 70,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.881,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.031,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.159,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.967,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.851,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.708,
          tou: 'bajo',
        ),
      ],
    ),
    'General 1 y 3': BlockTariff(
      fixedChargeBs: 25.692,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.231,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'General 2 y 4': BlockTariff(
      fixedChargeBs: 69.686,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.225,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
      fixedChargeBs: 25.692,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.162,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
      fixedChargeBs: 19.452,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 70,
          rateBsPerKwh: 0.761,
        ),
        EnergyBlock(
          startKwhExclusive: 70,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.872,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.391,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.192,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.728,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.529,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.47,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.271,
          tou: 'bajo',
        ),
      ],
    ),
  },
  Distributor.elfec: {
    'Domiciliaria PDBT': BlockTariff(
      fixedChargeBs: 24.202,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.89,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.182,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.189,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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

    'Domiciliaria MDBT': BlockTariff(
      fixedChargeBs: 28.012,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.448,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.628,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.718,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
      fixedChargeBs: 27.985,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.447,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 0.626,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.713,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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

    'Domiciliaria PDMT': BlockTariff(
      fixedChargeBs: 24.944,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.795,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.113,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: 500,
          rateBsPerKwh: 1.127,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
    'Agro MDBT (no calcula potencia)': BlockTariff(
      fixedChargeBs: 12.52,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.401,
        ),
      ],
    ),
    'Agro MDMT (no calcula potencia)': BlockTariff(
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
    'Agua potable PDBT (ExElepsa)': BlockTariff(
      fixedChargeBs: 18.885,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.505,
        ),
      ],
    ),
    'Agua potable GDBT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 18.411,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.653,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.581,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.518,
          tou: 'bajo',
        ),
      ],
    ),
    'Agua potable GDMT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 18.411,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.618,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.547,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.488,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.171,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.051,
          tou: 'bajo',
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
          tou: 'alto', // BA
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.176,
          tou: 'medio', // BM
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.054,
          tou: 'bajo', // BB
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
      fixedChargeBs: 29.623,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.748,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'Comercial PDMT': BlockTariff(
      fixedChargeBs: 29.435,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.302,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.584,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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

    'Escenarios deportivos GDMT': BlockTariff(
      fixedChargeBs: 17.751,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.284,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 2.074,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.856,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.833,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.135,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.946,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.833,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.135,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.946,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.833,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.693,
          tou: 'bajo',
        ),
      ],
    ),
    'General PDBT': BlockTariff(
      fixedChargeBs: 31.517,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.017,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'General GDBT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.307,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.171,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.051,
          tou: 'bajo',
        ),
      ],
    ),
    'General GDMT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.294,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.176,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.054,
          tou: 'bajo',
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
    'General (SFL) PDBT': BlockTariff(
      fixedChargeBs: 29.623,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.748,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'General (SFL) PDMT': BlockTariff(
      fixedChargeBs: 29.435,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: 20,
          rateBsPerKwh: 0.302,
        ),
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.584,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'General(SFL) GDBT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.307,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.171,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.051,
          tou: 'bajo',
        ),
      ],
    ),
    'General(SFL) GDMT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.624,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.294,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.176,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.054,
          tou: 'bajo',
        ),
      ],
    ),

    'General(SFL) MDBT (No calcula para potencia)': BlockTariff(
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
      fixedChargeBs: 29.623,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.748,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.584,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
    'Industrial GDBT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.873,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.625,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.564,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.488,
          tou: 'bajo',
        ),
      ],
    ),

    'Industrial GDMT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.873,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.611,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.547,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.477,
          tou: 'bajo',
        ),
      ],
    ),

    'Industrial GDST (No calcula potencia)': BlockTariff(
      fixedChargeBs: 23.873,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.526,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.459,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.413,
          tou: 'bajo',
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
      fixedChargeBs: 25.013,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 20,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.966,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 300,
          rateBsPerKwh: 1.196,
        ),
        EnergyBlock(
          startKwhExclusive: 300,
          endKwhInclusive: null,
          rateBsPerKwh: 1.215,
        ),
      ],
    ),
    'Transporte eléctrico GDMT (No calcula potencia)': BlockTariff(
      fixedChargeBs: 18.922,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.868,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.795,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.719,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.363,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.168,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.693,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.497,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.44,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 1.244,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.8,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.735,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.816,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.749,
          tou: 'bajo',
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
      fixedChargeBs: 38.7,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 30,
          endKwhInclusive: 50,
          rateBsPerKwh: 1.311,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
          endKwhInclusive: 120,
          rateBsPerKwh: 1.49,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
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
      fixedChargeBs: 28.730,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 15,
          endKwhInclusive: 70,
          rateBsPerKwh: 0.84,
        ),
        EnergyBlock(
          startKwhExclusive: 70,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.861,
        ),
        EnergyBlock(
          startKwhExclusive: 200,
          endKwhInclusive: 500,
          rateBsPerKwh: 0.919,
        ),
        EnergyBlock(
          startKwhExclusive: 500,
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.416,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.404,
          tou: 'bajo',
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
          startKwhExclusive: 30,
          endKwhInclusive: 50,
          rateBsPerKwh: 1.314,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
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
          startKwhExclusive: 30,
          endKwhInclusive: 50,
          rateBsPerKwh: 1.314,
        ),
        EnergyBlock(
          startKwhExclusive: 50,
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.816,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.749,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.763,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.7,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.816,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.749,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.48,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.443,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.459,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.429,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.416,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.404,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.276,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.251,
          tou: 'bajo',
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
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.287,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.263,
          tou: 'bajo',
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
    'P_GD-MT': BlockTariff(
      fixedChargeBs: 34.02,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.302,
          tou: 'alto',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.286,
          tou: 'medio',
        ),
        EnergyBlock(
          startKwhExclusive: 0,
          endKwhInclusive: null,
          rateBsPerKwh: 0.262,
          tou: 'bajo',
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
      fixedChargeBs: 33.085,
      blocks: const [
        EnergyBlock(
          startKwhExclusive: 15,
          endKwhInclusive: 120,
          rateBsPerKwh: 0.843,
        ),
        EnergyBlock(
          startKwhExclusive: 120,
          endKwhInclusive: 200,
          rateBsPerKwh: 0.892,
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

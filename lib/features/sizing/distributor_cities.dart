import '../billing/billing_model.dart';

/// Ciudades sugeridas por distribuidora.
/// Las claves deben coincidir con las claves de citiesHsp en hsp_data.dart.
final Map<Distributor, List<String>> distributorCities = {
  Distributor.delapaz: const ['LA PAZ', 'EL ALTO', 'VIACHA'],
  Distributor.elfec: const ['COCHABAMBA', 'SACABA', 'QUILLACOLLO'],
  Distributor.cre: const [
    'SANTA CRUZ DE LA SIERRA',
    'MONTERO',
    'WARNES',
    'CAMIRI',
    'SAN IGNACIO DE VELASCO',
    'PUERTO SUAREZ',
  ],
  Distributor.cessa: const ['SUCRE'],
  Distributor.endeDeoruro: const ['ORURO'],
  Distributor.endeDelbeni: const ['TRINIDAD', 'RIBERALTA', 'GUAYARAMERIN'],
};

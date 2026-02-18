class CityHsp {
  final String city;
  final double hsp;
  final double latitude;
  const CityHsp(this.city, this.hsp, this.latitude);
}

const citiesHsp = <String, CityHsp>{
  'LA PAZ': CityHsp('La Paz', 5.6, -16.4897),
  'EL ALTO': CityHsp('El Alto', 5.8, -16.5),
  'VIACHA': CityHsp('Viacha', 5.7, -16.6528),
  'COCHABAMBA': CityHsp('Cochabamba', 5.5, -17.3935),
  'SACABA': CityHsp('Sacaba', 5.5, -17.3978),
  'QUILLACOLLO': CityHsp('Quillacollo', 5.6, -17.3928),
  'SANTA CRUZ DE LA SIERRA': CityHsp('Santa Cruz de la Sierra', 5.3, -17.7833),
  'MONTERO': CityHsp('Montero', 5.4, -17.3387),
  'WARNES': CityHsp('Warnes', 5.4, -17.5089),
  'CAMIRI': CityHsp('Camiri', 5.7, -20.0378),
  'SAN IGNACIO DE VELASCO': CityHsp('San Ignacio de Velasco', 5.6, -16.3667),
  'PUERTO SUAREZ': CityHsp('Puerto Suárez', 5.5, -18.95),
  'SUCRE': CityHsp('Sucre', 5.9, -19.0333),
  'TARIJA': CityHsp('Tarija', 6.1, -21.5355),
  'YACUIBA': CityHsp('Yacuiba', 6.2, -22.0167),
  'ORURO': CityHsp('Oruro', 6.3, -17.9833),
  'POTOSI': CityHsp('Potosí', 6.4, -19.5836),
  'UYUNI': CityHsp('Uyuni', 6.8, -20.4609),
  'VILLAZON': CityHsp('Villazón', 6.5, -22.0866),
  'TRINIDAD': CityHsp('Trinidad', 5.1, -14.8333),
  'RIBERALTA': CityHsp('Riberalta', 5.0, -10.9833),
  'GUAYARAMERIN': CityHsp('Guayaramerín', 5.0, -10.8167),
  'COBIJA': CityHsp('Cobija', 4.9, -11.0333),
};

String normKey(String s) =>
    s.trim().toUpperCase().replaceAll(RegExp(r'\s+'), ' ');

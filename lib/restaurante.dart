import 'package:projetoflutter/tipo.dart';

class Restaurante{
  int? _codigorestaurante;
  String? _nomerestaurante;
  String? _latitude;
  String? _longitude;
  Tipo? _culinaria;

  Restaurante({
    int? codigorestaurante,
    String? nomerestaurante,
    String? latitude,
    String? longitude,
    Tipo? culinaria,
  }){
    _codigorestaurante = codigorestaurante;
    _nomerestaurante = nomerestaurante;
    _latitude = latitude;
    _longitude = longitude;
    _culinaria = culinaria;
  }
  int? get codigorestaurante => _codigorestaurante;
  String? get nomerestaurante => _nomerestaurante;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  Tipo? get culinaria => _culinaria;

  set nomerestaurante(String? nomerestaurante) => _nomerestaurante = nomerestaurante;
  set codigorestaurante(int? codigorestaurante) => _codigorestaurante = codigorestaurante;
  set latitude(String? latitude) => _latitude = latitude;
  set longitude(String? longitude) => _longitude = longitude;
  set culinaria(Tipo? culinaria) => _culinaria = culinaria;
}

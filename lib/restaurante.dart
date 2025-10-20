import 'package:projetoflutter/tipo.dart';

class Restaurante{
  int? _codigorestaurante;
  String? _nomerestaurante;
  String? _latitude;
  String? _longitude;
  int? _culinaria;

  Restaurante({
    int? codigorestaurante,
    String? nomerestaurante,
    String? latitude,
    String? longitude,
    int? culinaria,
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
  int? get culinaria => _culinaria;

  set nomerestaurante(String? nomerestaurante) => _nomerestaurante = nomerestaurante;
  set codigorestaurante(int? codigorestaurante) => _codigorestaurante = codigorestaurante;
  set latitude(String? latitude) => _latitude = latitude;
  set longitude(String? longitude) => _longitude = longitude;
  set culinaria(int? culinaria) => _culinaria = culinaria;
}

import 'usuario.dart';
import 'tipo.dart';


class Restaurante{
  String? _nome;
  int? _cd_rest;
  double? _latitude;
  double? _longitude;
  Usuario? _cd_user;
  Tipo? _cd_tipo;

  Restaurante({String? nome, int? cd_rest, double? latitude,
    double? longitude, Usuario? cd_user, Tipo? cd_tipo}){
    _nome = nome;
    _cd_rest = cd_rest;
    _latitude = latitude;
    _longitude = longitude;
    _cd_user= cd_user;
    _cd_tipo = cd_tipo;
  }

  String? get nome => _nome;
  set nome (String? nome) => _nome = nome;

  int? get cd_rest => _cd_rest;
  set cd_rest(int? cd_rest) => _cd_rest = cd_rest;

  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;

  double? get longitude => _longitude;
  set longitude (double? latitude) => _longitude = longitude;

  Usuario? get cd_user => _cd_user;
  set cd_user(Usuario? cd_user) => _cd_user = cd_user;

  Tipo? get cd_tipo => _cd_tipo;
  set cd_tipo (Tipo? cd_tipo) => _cd_tipo = cd_tipo;

}
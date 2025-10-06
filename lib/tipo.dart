class Tipo{
  int? _cd_tipo;
  String? _nome;

  Tipo({int? codigo, String? nome}){
    _cd_tipo = codigo;
    _nome = nome;
  }

  // metodo classico para metodo get
  int? get codigo{
    return _cd_tipo;
  }

  //metodo para dart
  String? get nome => _nome;

  //metodo classico
  set codigo(int? codigo){
    _cd_tipo = codigo;
  }

  //metodo adaptado para dart
  set nome(String?nome) => _nome = nome;

}
class Usuario{
  int? _codigousoa;
  String? _nomeusoa;
  String? _loginusoa;
  String? _senhausoa;

  Usuario({
    int? codigousoa,
    String? senhausoa,
    String? loginusoa,
    String? nomeusoa
}){
    _codigousoa = codigousoa;
    _loginusoa = loginusoa;
    _nomeusoa = nomeusoa;
    _senhausoa = senhausoa;
  }

  //Getters
  //exemplo Tradicional
  String? get loginusoa{
      return _loginusoa;
  }
  //metodo ao estilo dart
  int? get codigousoa => _codigousoa;
  String? get nomeusoa => _nomeusoa;
  String? get senhausoa => _senhausoa;

  //setters
  //set tradicional
  set codigousoa(int? codigousoa){
    _codigousoa = codigousoa;
  }
  //metodo ao estilo dart
  set nomeusoa(String? nome) => _nomeusoa = nomeusoa;
  set loginusoa(String? login) => _loginusoa = loginusoa;
  set senhausoa(String? senhausoa) => _senhausoa = senhausoa;
}
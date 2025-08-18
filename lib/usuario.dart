class Usuario{
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({
    int? codigo,
    String? senha,
    String? login,
    String? nome
}){
    _codigo = codigo;
    _login = login;
    _nome = nome;
    _senha = senha;
  }

  //Getters
  //exemplo Tradicional
  String? get login{
      return _login;
  }
  //metodo ao estilo dart
  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get senha => _senha;

  //setters
  //set tradicional
  set codigo(int? codigo){
    _codigo = codigo;
  }
  //metodo ao estilo dart
  set nome(String? nome) => _nome = nome;
  set login(String? login) => _login = login;
  set senha(String? senha) => _senha = senha;
}
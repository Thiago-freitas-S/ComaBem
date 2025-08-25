import 'package:flutter/material.dart';
import 'package:projetoflutter/tela_login.dart';
import 'usuario.dart';
import 'tipo.dart';
import 'restaurante.dart';
import 'tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /*Usuario u = Usuario(
        codigousoa: 1,
        loginusoa: "thiago123",
        nomeusoa: "Thiago",
        senhausoa: "@senhaforte123"
    );
    Restaurante r = Restaurante(
      codigorestaurante: 1,
      longitude: -23.976310,
      latitude: -46.478080,
      nomerestaurante: "Japacama"

    );
    Tipo t = Tipo(
      nomedotipoderestaurante: "Japonesa"
    );*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}
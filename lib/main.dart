import 'package:flutter/material.dart';
import 'usuario.dart';
import 'tipo.dart';
import 'restaurante.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Usuario u = Usuario(
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
    );
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados:"),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(2.0),
          child:Column(
            children: [
            Text("Nome:${u.nomeusoa}"),
            Text("Código:${u.codigousoa}"),
            Text("Login:${u.loginusoa}"),
            Text("Senha:${u.senhausoa}"),
              Divider(
                color: Colors.black,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
            Text("Codigo do Restaurante: ${r.codigorestaurante}"),
            Text("Nome do Restaurate: ${r.nomerestaurante}"),
            Text("Localização: ${r.latitude}, ${r.longitude}"),
            Text("Nome do Proprietário: ${u.nomeusoa}"),
            Text("tipo de Culinária: ${t.nomedotipoderestaurante}")
          ]
            ,)
          ,),
      ),
      )
    );

  }
}
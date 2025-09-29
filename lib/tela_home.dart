import 'package:flutter/material.dart';
import 'package:projetoflutter/tela_cad_restaurante.dart';

class Telahome extends StatelessWidget{
  const Telahome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seja Bem-vindo: ")),
      body: Padding(padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("lista de Restaurantes: "),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
            }, child: Text("Cadastrar Novo Restaurante")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Meu Restaurante"),
                    Text("Comida Mexicana")
                  ],
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text("Excluir")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){}, child: Text("Editar"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
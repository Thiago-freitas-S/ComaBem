import 'dart:ffi';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:projetoflutter/banco/restaurante_dao.dart';
import 'package:projetoflutter/restaurante.dart';
import 'package:projetoflutter/tela_cad_restaurante.dart';

class Telahome extends StatefulWidget {
  const Telahome({super.key});

  @override
  State<Telahome> createState() => TelahomeState();
}


class TelahomeState extends State<Telahome>{
List<Restaurante> restaurantes = [];
Future <void> carregaRestaurantes() async{
  final lista = await RestauranteDAO.listarTodos();
  setState((){
    restaurantes = lista;
  });
}

@override
void initState(){
  super.initState();
  carregaRestaurantes();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Lista de Restaurantes"),
          actions: [
              IconButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));

              }, icon: Icon(Icons.add)
              )
          ],
      ),
      body: Padding(padding: const EdgeInsets.all(30),
          child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context,index){
            final r = restaurantes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nomerestaurante??'Sem Nome'),
                subtitle: Text('ID: ${r.codigorestaurante}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.orange)),
                    IconButton(onPressed: (){
                      AlertDialog(
                        title: Text('Apagar Restaurante'),
                        content: Text('Excluir Restaurante?'),
                        actions: [
                          TextButton(onPressed: (){

                          },
                              child: Text('Sim')
                          ),
                          TextButton(onPressed: (){

                          },
                              child: Text('Não')
                          )
                        ],
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red,))
                  ],
                ),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
        },
        child: Icon(Icons.add)
      ),
    );
  }
}


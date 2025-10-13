import 'package:flutter/material.dart';
import 'package:projetoflutter/banco/restaurante_dao.dart';
import 'package:projetoflutter/banco/tipo_dao.dart';
import '../tipo.dart';

class TelaCadRestaurante extends StatefulWidget {
  TelaCadRestaurante({super.key});

  @override
  State<StatefulWidget> createState() {
    return TelacadRestauranteState();
  }
}

class TelacadRestauranteState extends State<TelaCadRestaurante>{

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;

  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;

  void initState(){
    super.initState();
    carregarTipos();
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Informações do Restaurante"),
          SizedBox(height: 30),
          Text("Tipo de Comida: "),
          DropdownButtonFormField <String>(
              value: culinariaSelecionada,
              items: tiposCulinaria.map((tipo){
                return DropdownMenuItem<String>(
                  value: tipo.nomedotipoderestaurante,
                  child: Text("${tipo.nomedotipoderestaurante}"),
                );
              }).toList(),
              onChanged: (String? novaCulinaria){
             setState(() {
               culinariaSelecionada = novaCulinaria;
               Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                   (tipo) => tipo.nomedotipoderestaurante == novaCulinaria,
               );
               tipoCulinaria = tipoSelecionado.codigodotipo;
             });
          }),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
            validator: (String? value){},
            controller: nomeController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Latitude'),
            validator: (String? value){},
            controller: latitudeController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Logitude'),
            validator: (String? value){},
            controller: longitudeController,
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: () async{
            final sucesso = await RestauranteDAO.cadastrarRestaurante(nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);
            String? msg = 'ERRO: Restaurante não cadastrado.';
            Color corFundo = Colors.red;
            if(sucesso > 0 ){
                msg = '${nomeController.text} Cadastrado! ID:$sucesso';
                corFundo = Colors.green;
              }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),backgroundColor: corFundo,duration: Duration(seconds: 5),));
          },
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save),
              Text("Cadastrar")
            ],
          )
          )
        ],
      ),
    ),
  );
  }
}
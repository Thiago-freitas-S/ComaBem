import 'package:flutter/material.dart';
import 'usuario.dart';
import 'tela_home.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  Usuario u = Usuario(
      codigousoa: 1,
      loginusoa: "thiago123",
      nomeusoa: "Thiago",
      senhausoa: "@senhaforte123"
  );

final TextEditingController usuarioController = TextEditingController();
final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Login")),
      body: Padding(padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Usuário'),
            controller: usuarioController,
          ),
          const SizedBox(height: 40,),
          TextField(
            decoration: const InputDecoration(labelText: 'Senha'),
            obscureText: true,
            controller: senhaController,
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            if (usuarioController.text == u.loginusoa && senhaController.text == u.senhausoa){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> Telahome())
              );
            }else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Usuario ou senha Invalidos!! "))
                  );
            }
          }, child: const Text('Entrar'))
        ],
      ),
      )
    );
  }
}
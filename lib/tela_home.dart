import 'package:flutter/material.dart';

class Telahome extends StatelessWidget{
  Telahome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seja Bem-vindo: ")),
      body: const Center(
        child: Text("Tela de Home"),
      ),
    );
  }
}
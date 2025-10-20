import 'package:flutter/material.dart';
import 'package:mimpedir/restaurante.dart';

class EditRestaurante extends StatelessWidget{
  static Restaurante restaurante = Restaurante();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
      child: Column(


      ),
     ),
    );
  }
}
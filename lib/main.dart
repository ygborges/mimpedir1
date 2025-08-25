import 'package:flutter/material.dart';
import 'package:mimpedir/tela_login.dart';
import 'usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /*Usuario u = Usuario(
      codigo: 1,
      login: "jussimar321",
      nome: "jussimar do java",
      senha: "@senhaforte123"
    );*/

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Telalogin(),
    );
  }
}


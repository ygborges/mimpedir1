import 'package:flutter/material.dart';
import 'package:mimpedir/tela_home.dart';
import 'package:mimpedir/usuario.dart';
import 'banco/usuario_dao.dart';

class Telalogin extends StatelessWidget{
  Telalogin({super.key});

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  /*Usuario u = Usuario(
    codigo: 1,
      senha: "senhaforte123",
    login: 'admin',
    nome:'Administrador'
  );*/
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Login")),
      body: Padding(padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'usuário'),
              controller: usuarioController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'senha'),
              obscureText: true,
              controller: senhaController,
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () async{

              final sucesso = await UsuarioDAO.autenticar(usuarioController.text, senhaController.text);

              if(sucesso){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaHome())
                );

              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Login e senha inválidos"))
                );
              }
            }, child: Text("Login"))
          ],
      )
      )
    );
  }
}
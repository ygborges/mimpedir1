import 'package:flutter/material.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';

import 'banco/restaurante_DAO.dart';

class TelaCadRestaurante extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}
class TelaCadRestauranteState extends State<TelaCadRestaurante>{

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo> tiposCulinaria =[];
  int? tipoCulinaria;

  void initState(){
    super.initState();
    carregarTipos();
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDao.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Informações do Restaurante:"),
          SizedBox(height: 40),
          Text("Tipo de comida:"),

          DropdownButtonFormField<String>(
              value: culinariaSelecionada,
              items: tiposCulinaria.map((tipo) {
                return DropdownMenuItem<String>(
                    value: tipo.nome,
                    child: Text("${tipo.nome}")
                );
              }).toList(),
              onChanged: (value){
                setState(() {
                  culinariaSelecionada = value;
                  Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                      (tipo) => tipo.nome == value
                  );

                  tipoCulinaria = tipoSelecionado.codigo;
                });
              }
          ),
           TextFormField(
            decoration: const InputDecoration(hintText: "Nome do Restaurante"),
            validator: (String? value) {},
             controller: nomeController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Latitude"),
            validator: (String? value) {},
            controller: latitudeController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'longitude'),
            validator: (String? value) {},
            controller: longitudeController,
          ),
          ElevatedButton(
              onPressed: ()async{
                final sucesso = await RestauranteDAO.cadastrarRestaurante(nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);
                String msg ='Erro: nao cadastrado. Verifique os dados.';
                Color corFundo = Colors.red;

                if(sucesso > 0) {
                  msg = '"${nomeController
                      .text}"cadastrado com sucessp! ID: $sucesso';
                  corFundo = Colors.green;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(msg),
                    backgroundColor: corFundo ,
                    duration: Duration(seconds: 5),
                  )
                );
              },
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save),
              Text("cadastrar")
            ],
          ))
        ],
      ),
     ),
    );
  }

}
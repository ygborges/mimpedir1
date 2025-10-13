import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/edit_restaurante.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}
  class TelaHomeState extends State <TelaHome>{
  List<Restaurante> restaurante = [];

  @override
  void initState(){
      super.initState();
      carregarRestaurante();
  }

  Future<void>carregarRestaurante() async{
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurante = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Restaurante'),
      actions: [
        IconButton(onPressed: (){
          final t = Navigator.push(context,
            MaterialPageRoute(builder: (context) => TelaCadRestaurante())
          );

          if(t == true || t == null){
            setState(() {
              carregarRestaurante();
            });
          }

            },
            icon: Icon(Icons.add))
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){
            final r = restaurante[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome?? 'semnome'),
                subtitle: Text('ID: ${r.cd_rest}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditRestaurante()));
                    }, icon: Icon(Icons.edit, color: Colors.black,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.redAccent,)),
                  ],
                ),
              ),
            );
          }

        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context,
          MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
        },
      child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar')
          ]
      ),
    );
  }
}
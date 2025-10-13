import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/usuario_dao.dart';

import '../restaurante.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_restaurante',
      where: 'cd_usuario = ?',
    whereArgs: [UsuarioDAO.usuariologado.codigo]);
    
    return resultado.map((mapa){
      return Restaurante(
        cd_rest: mapa['cd_restaurante'] as int,
        nome: mapa['nm_restaurante'] as String
      );
    }).toList();
  }

  static Future<int> cadastrarRestaurante(
      String? nome, String? latitude, String? longitude, int? tipo
      )async{
    final db = await DatabaseHelper.getDataBase();

    final dadosRestaurante = {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'logitude_restaurante': longitude,
      'cd_tipo': tipo,
      'cd_usuario': UsuarioDAO.usuariologado.codigo
    };
    try {
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    }catch(e){
      print("Erro ao cadastrar: $e");
      return-1;
    }
  }
}
import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/tipo.dart';

import '../restaurante.dart';

class RestauranteDAO{

  static Future<void> atualizar(int? cd, String? nome, String? lat, String long, int? tipo) async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.update('tb_restaurante',
    {
      'nm_restaurante': nome,
      'latitude_restaurante': lat,
      'longitude_restaurante': long,
      'cd_tipo': tipo

    },
    where: 'cd_restaurante =?',
    whereArgs: [cd]
    );
  }

  static Future<Restaurante> listar(int? cd) async{
    final db= await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_restaurante',
    where: 'cd_restaurante = ?',
      whereArgs: [cd]
    );
    return Restaurante(
      cd_rest: resultado.first['cd_restaurante'] as int,
      nome: resultado.first['nm_restaurante'] as String,
      latitude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      cd_tipo: await TipoDao.listar(resultado.first['cd_tipo'] as int) as Tipo
    );
  }

  static Future<void> excluir(Restaurante r) async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = db.delete('tb_restaurante',
      where: 'cd_restaurante = ?',
      whereArgs: [r.cd_rest]
    );
  }

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
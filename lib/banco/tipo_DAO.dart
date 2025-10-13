import 'package:mimpedir/banco/database_helper.dart';

import '../tipo.dart';

class TipoDao{

  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_tipo');

    return resultado.map((mapa){
      return Tipo(
        codigo: mapa['cd_tipo'] as int,
        nome: mapa['nm_tipo'] as String
      );
    }).toList();

  }

}
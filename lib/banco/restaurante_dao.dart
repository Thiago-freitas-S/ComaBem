import 'package:projetoflutter/banco/database_helper.dart';
import 'package:projetoflutter/restaurante.dart';
import 'package:projetoflutter/tipo.dart';
import 'package:sqflite/sqflite.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante');

    return  resultado.map((mapa){
      return Restaurante(
        codigorestaurante: mapa['cd_restaurante'] as int,
        nomerestaurante: mapa['nm_restaurante'] as String
      );
    }).toList();
  }
}
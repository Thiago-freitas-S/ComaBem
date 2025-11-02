import 'package:projetoflutter/banco/database_helper.dart';
import 'package:projetoflutter/banco/tipo_dao.dart';
import 'package:projetoflutter/restaurante.dart';
import './usuario.dao.dart';
import 'package:projetoflutter/tipo.dart';
import 'package:sqflite/sqflite.dart';


class RestauranteDAO{

  static Future<void> atualizarRestaurante(int? cd,String? nome,String? latitude,String? longitude, int? tipo) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = db.update('tb_restaurante',
        {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo':tipo
    },
    where: 'cd_restaurante =?',
    whereArgs:[cd]
    );
  }

  static Future<Restaurante> listar(int? id) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
    where: 'cd_restaurante = ?',
    whereArgs: [id]
    );

    return Restaurante(
      codigorestaurante: resultado.first['cd_restaurante'] as int,
      nomerestaurante: resultado.first['nm_restaurante'] as String,
      latitude: resultado.first['latitude_restaurante'] as String,
      longitude: resultado.first['longitude_restaurante'] as String,
      culinaria: await TipoDAO.listar(resultado.first['cd_tipo'] as int?),
    );
  }

  static Future<void> excluir(Restaurante r ) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.delete('tb_restaurante',
      where: 'cd_restaurante = ?',
      whereArgs: [r.codigorestaurante]
    );
  }

  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
      where: 'cd_usuario = ?',
      whereArgs: [UsuarioDAO.Usuariologado.codigousoa]
    );

    return  resultado.map((mapa){
      return Restaurante(
        codigorestaurante: mapa['cd_restaurante'] as int,
        nomerestaurante: mapa['nm_restaurante'] as String
      );
    }).toList();
  }
  static Future<int> cadastrarRestaurante(
      String? nomeRestaurante,
      String? latitude,
      String? longitude,
      int? tipo
      )async{
   final db = await DatabaseHelper.getDatabase();
   final dadosRestaurante = {
     'cd_tipo': tipo,
     'nm_restaurante': nomeRestaurante,
     'latitude_restaurante': latitude,
     'longitude_restaurante': longitude,
     'cd_usuario': UsuarioDAO.Usuariologado.codigousoa
   };
   try{
     final idRestaurante = await db.insert('tb_restaurante',dadosRestaurante);
     return idRestaurante;
   } catch(e){
     print("Erro ao cadastrar  restaurante: $e");
     return -1;
   }
  }
}
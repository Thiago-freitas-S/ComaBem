import 'package:projetoflutter/usuario.dart';
import 'database_helper.dart';

class UsuarioDAO{
  static Usuario Usuariologado = Usuario();
  static  Future<bool> autenticar(String login, String senha) async{

    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query(
      'tb_usuario',
      where: 'nm_login = ? and ds_senha = ?',
      whereArgs: [login,senha]
    );
    Usuariologado.codigousoa = resultado.first['cd_usuario'] as int;
    Usuariologado.nomeusoa = resultado.first['nm_usuario'] as String;

    return resultado.isNotEmpty;
  }

}
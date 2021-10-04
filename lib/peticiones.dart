import 'dart:convert';
import 'package:ejemplo8_shared_perefences/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fecthLogin(http.Client client, String user, String pass) async {
  final response = await http.post(
      Uri.parse(
          'https://desarolloweb2021a.000webhostapp.com/proyectomensajerosapi/login.php'),
      body: {
        "idusuario": user,
        "pass": pass,
      });

  final pasar = jsonDecode(response.body)[0];
  // print(pasar[0]['usuario']);
  print(pasar);
  print("hola");
  guardarusuario(pasar);

}


Future<void> guardarusuario(datos) async {
  SharedPreferences localuser = await SharedPreferences.getInstance();
 
  localuser.setString('usuario', json.encode(datos));
  //print(localuser.getString('usuario'));
 print("object");
}
 Future<User> consultarusuario() async {
    SharedPreferences _localuser = await SharedPreferences.getInstance();
   // final SharedPreferences localuser = await _localuser;
    /*setState(() {
      usuarior = localuser.getString('usuario');
    });*/
    User user =  new User.fromJson(json.decode( _localuser.getString('usuario')??''));
    print("Hola aqui");
    print(user.usuario);
    print(user.clave);
    print(user.estado);
    return user;

  }

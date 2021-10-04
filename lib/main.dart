import 'package:ejemplo8_shared_perefences/bienvenida.dart';
import 'package:ejemplo8_shared_perefences/login.dart';
import 'package:ejemplo8_shared_perefences/peticiones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp()); 
}

 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState(

  );
}

class _MyHomePageState extends State<MyHomePage> {
  User? usuario;

  @override
  void initState() {
    super.initState();
    //consultarusuarios();
  }

  consultarusuarios() async {
      
    setState(() async {
      usuario = await consultarusuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usuarioTextController = TextEditingController();
    TextEditingController clave = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Persistencia de Datos')),
      body: Container(
       
       decoration: new BoxDecoration(
          gradient:new LinearGradient( colors: [const Color(0xFF915FB5),const Color(0xFFCA436B)],
   
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
                     stops: [0.0,1.0],
                     tileMode: TileMode.clamp
          )),
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/3.png', height: 70.0,),
              // Icon(Icons.supervised_user_circle, color: Colors.white70, size: 120,),
               Text('Iniciar sesion', style: Theme.of(context).textTheme.headline4 , ),
               
                SizedBox( height: 50 ),
               
              TextField(
                
                
                controller: usuarioTextController,
                decoration: InputDecoration(hintText: "Digite el Usuario"),
              ),
              TextField(
                controller: clave,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Digite la Contraseña",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                icon: Icon(Icons.login),
                onPressed: () async { 
                // consultarusuarios();

                 await fecthLogin(http.Client(), usuarioTextController.text, clave.text);
                 //consultarusuario();
                  //usuario = await consultarusuario();
                 setState(() {});
                 Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => UserNew()), 
                 );
                },


              ),
              SizedBox(
                height: 20,
              ),
              Text('Usuario Guardardo' + (usuario?.usuario??'  no autenticado'))
            ],
          ),
        ),
      ),
    );
  }
}

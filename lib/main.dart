import 'dart:ui';

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
            children: <Widget>[
             // Image.asset('assets/3.png', height: 70.0,),
                SizedBox( height: 20 ),
              // Icon(Icons.supervised_user_circle, color: Colors.white70, size: 120,),
               Text('Instagram', 
               style: TextStyle(fontFamily: 'Billabong',
               fontSize: 70, 
               color: Colors.white),),

                SizedBox( height: 50 ),

              TextField(
               controller: usuarioTextController,
                decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white24,
                  hintText: "Nombre el Usuario",
                hintStyle: TextStyle(color:Colors.white54,),
                 
                border: OutlineInputBorder(
                 
                   borderSide: BorderSide.none,
                    borderRadius:BorderRadius.circular(10),
                  
                )
                
                

                ),
                
               
              ),
               SizedBox( height: 10 ),
              TextField(
                
                controller: clave,
                obscureText: true,
                keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white24,
                  hintText: "Contraseña",
                hintStyle: TextStyle(color:Colors.white54,), 
                border: OutlineInputBorder(
                  
                  borderSide: BorderSide.none,
                    borderRadius:BorderRadius.circular(10),
                  
                  
                )

                ),
               
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 20.0),
                    Container(
                      
                      
                      width: 250.0,
                      child: FlatButton(
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
                        
                        color: Colors.white10,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Iniciar sesiòn',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
              /*IconButton(
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


              ),*/
              SizedBox(
                height: 20,
              ),
              Text('Usuario Guardardo' + (usuario?.estado??'  no autenticado'))
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:html';

import 'package:ejemplo8_shared_perefences/peticiones.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class UserNew extends StatefulWidget {
  UserNew({Key? key}) : super(key: key);

  @override
  _UserNewState createState() => _UserNewState();
}

class _UserNewState extends State<UserNew> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datos del Usuario',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Bienvenida(),
    );
  }
}
class HomeUser extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Bienvenida(),
    );
  }
}

class Bienvenida extends StatefulWidget {
  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
//final String user;
User? user;

@override
void initState() {
  
    // TODO: implement initState
    super.initState();
    //user = await consultarusuario();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Usuario'))
        ,
      
       body: Center(
          child: FutureBuilder<User>(
              future: consultarusuario(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                      case ConnectionState.done:
                    return Column(
                      children: [
                         SizedBox(height: 20),
                        Container(
                          padding:EdgeInsets.all(15) ,
                          
                          child:TextFormField(
                            initialValue: snapshot.data!.usuario,
                            enabled: false,
              
                             decoration: InputDecoration(
                               icon: Icon(Icons.supervised_user_circle_rounded, color: Colors.black),
                                labelText: 'Usuario : ',
                              ),
                          ) ,
                          
                          

                        ),
                         SizedBox(height: 20),
                        Container(
                          padding:EdgeInsets.all(15) ,
                          
                          child:TextFormField(
                            initialValue: snapshot.data!.clave,
                            enabled: false,
              
                             decoration: InputDecoration(
                               icon: Icon(Icons.password_rounded, color: Colors.black),
                                labelText: 'Clave : ',
                              ),
                          ) ,

                        ),
                         SizedBox(height: 20),
                        Container(
                          padding:EdgeInsets.all(15) ,
                          
                          child:TextFormField(
                            initialValue: snapshot.data!.acceso,
                            enabled: false,
              
                             decoration: InputDecoration(
                               icon: Icon(Icons.manage_accounts_rounded , color: Colors.black),
                                labelText: 'Acceso : ',
                              ),
                          ) ,

                        ),
                         SizedBox(height: 20),
                        Container(
                          padding:EdgeInsets.all(15) ,
                          
                          child:TextFormField(
                            initialValue: snapshot.data!.estado,
                            enabled: false,
              
                             decoration: InputDecoration(
                               icon: Icon(Icons.subdirectory_arrow_left_outlined, color: Colors.black),
                                labelText: 'Estado: ',
                              ),
                          ) ,

                        ),
                         SizedBox(height: 20),
                        Container(
                          padding:EdgeInsets.all(15) ,
                          
                          child:TextFormField(
                            initialValue: snapshot.data!.color,
                            enabled: false,
              
                             decoration: InputDecoration(
                               icon: Icon(Icons.color_lens_outlined , color: Colors.black),
                                labelText: 'Color : ',
                              ),
                          ) ,

                        ),
                        
                        
                      ],
                      
                      );
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                      );
                    }
                }
              }
              )
              ),
    );
  }
}

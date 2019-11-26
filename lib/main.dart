import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trab_malignous/postagem.dart';
import 'package:trab_malignous/postagemImagem.dart';
import 'package:trab_malignous/postagemTexto.dart';
import 'package:trab_malignous/rodape.dart';
import 'package:trab_malignous/cabecalho.dart';
import 'package:flutter/services.dart';
import 'package:trab_malignous/teste.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: Color.fromRGBO(74, 65, 42, 1), // Barra de baixo
//       statusBarColor: Colors.purple[300], // Barra de cima
//     ));
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BReddit',
//       home: Scaffold(
//         appBar: Cabecalho(),
//         body: MyScreen(),
//         bottomNavigationBar: Rodape(),
//         backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  createState() => _Myapp();
}

class _Myapp extends State {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(74, 65, 42, 1), // Barra de baixo
      statusBarColor: Colors.purple[300], // Barra de cima
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BReddit',
      home: Scaffold(
        appBar: Cabecalho(),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
          child: new ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  child: Text(""),
                );
              }),
        ),
        bottomNavigationBar: Rodape(),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      ),
    );
  }
}

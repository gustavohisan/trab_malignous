import 'package:flutter/material.dart';
import 'package:trab_malignous/postagens.dart';
import 'package:trab_malignous/rodape.dart';
import 'package:trab_malignous/cabecalho.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        body: MyScreen(),
        bottomNavigationBar: Rodape(),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
   createState() => _MyScreen();
}

class _MyScreen extends State {

  //Criar algo para ler json e achar um jeito de comunicar com o postagens para integrar
  //crair uma interface que aceita postagens do tipo texto ou img
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
    child: new ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            child: Postagens(),
          );
        }),
  );
  }
}

// Widget buildBody() {

//   return new Container(
//     margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
//     child: new ListView.builder(
//         itemCount: 4,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (BuildContext ctxt, int index) {
//           return Container(
//             child: Postagens(),
//           );
//         }),
//   );
// }

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
        body: buildBody(),
        bottomNavigationBar: Rodape(),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      ),
    );
  }
}

Widget buildBody() {
  return new Container(
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
    child: new ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            child:Postagens(),
          );
        }),
  );
}

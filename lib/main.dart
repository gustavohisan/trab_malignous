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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Isso aqui é a cor do cabeçalho e rodapé do android, não esquece de mudar no fim
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(74, 65, 42, 1), // Barra de baixo
      statusBarColor: Colors.purple[300], // Barra de cima
    ));

    return MaterialApp(
      //Nao aparecer debug
      debugShowCheckedModeBanner: false,
      title: 'BReddit',
      home: Scaffold(
        //Chama a construção do cabecalho
        appBar: Cabecalho(),
        //Corpo
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
          //List view para mostrar todos os topicos
          child: new ListView.builder(
            //Agora so fazemos 5
              itemCount: 5,
              //Scroll vertical
              scrollDirection: Axis.vertical,
              //Começa a criação
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  child: PostagemImagem("Testea"),
                );
              }),
        ),
        //Criação do rodape
        bottomNavigationBar: Rodape(),
        //Cor de fundo do programa
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
            child: PostagemTexto("texte"),
          );
        }),
  );
  }
}

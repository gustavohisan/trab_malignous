import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Model/Postagem.dart';
import 'Screens/postagemImagem.dart';
import 'Screens/postagemTexto.dart';
import 'Screens/rodape.dart';
import 'Screens/cabecalho.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  //API
  var publicacoes = new List<Postagem>();
  fetchPost() async {
    final response = await http.get('http://192.168.0.16:3000/Publicacoes');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      Iterable list = json.decode(response.body);
      publicacoes = list.map((model) => Postagem.fromJson(model)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  final GlobalKey<RefreshIndicatorState> _recarregarInicioChave =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  dispose() {
    super.dispose();
  }
  //

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
          child: RefreshIndicator(
            key: _recarregarInicioChave,
            onRefresh: _recarregar,
            child: ListView.builder(
                //Agora so fazemos 5
                itemCount: publicacoes.length,
                //Scroll vertical
                scrollDirection: Axis.vertical,
                //Começa a criação
                itemBuilder: (BuildContext ctxt, int index) {
                  if (publicacoes[index].tipo.compareTo('texto') == 0) {
                    return Container(
                      child: PostagemTexto(postagem: publicacoes[index]),
                    );
                  } else {
                    return Container(
                      child: PostagemImagem(postagem: publicacoes[index]),
                    );
                  }
                }),
          ),
        ),
        //Criação do rodape
        bottomNavigationBar: Rodape(),
        //Cor de fundo do programa
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
      ),
    );
  }
}

Future<Null> _recarregar() {
      
}

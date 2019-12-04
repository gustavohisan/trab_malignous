import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trab_malignous/API/Api.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Testando o App'),
            ),
            body: Container(
                width: 500,
                height: 1000,
                child: Column(children: [
                  FutureBuilder(
                      future: getPostagens(),
                      builder: (context, projectSnap) {
                        if (projectSnap.data[0].corpo.toString() ==
                            "https://i.imgur.com/yio60Gp.jpg") {
                          return Text("Teste classe getPostagens: Ok");
                        } else {
                          return Text("Teste classe getPostagens: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: getTopicos(),
                      builder: (context, projectSnap) {
                        if (projectSnap.data[0].titulo.toString() ==
                            "Banco de Dados") {
                          return Text("Teste classe getTopicos: Ok");
                        } else {
                          return Text("Teste classe getTopicos: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: getMinhasPublicacoes(),
                      builder: (context, projectSnap) {
                        if (projectSnap.data[1].corpo.toString() ==
                            "https://i.imgur.com/yio60Gp.jpg") {
                          return Text("Teste classe getMinhasPublicacoes: Ok");
                        } else {
                          return Text(
                              "Teste classe getMinhasPublicacoes: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: getPostagemID(9),
                      builder: (context, projectSnap) {
                        if (projectSnap.data.corpo.toString() ==
                            "https://i.imgur.com/4AiXzf8.jpg") {
                          return Text("Teste classe getPostagemID: Ok");
                        } else {
                          return Text("Teste classe getPostagemID: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: getPostagemID(9),
                      builder: (context, projectSnap) {
                        if (projectSnap.data.corpo.toString() ==
                            "https://i.imgur.com/4AiXzf8.jpg") {
                          return Text("Teste classe getPostagemID: Ok");
                        } else {
                          return Text("Teste classe getPostagemID: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: arquivarPostagem(1),
                      builder: (context, projectSnap) {
                        if (projectSnap.data == true) {
                          return Text("Teste classe arquivarPostagem: Ok");
                        } else {
                          return Text("Teste classe arquivarPostagem: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: atualizarPostagem(9, "aaaaaaaa"),
                      builder: (context, projectSnap) {
                        if (projectSnap.data == true) {
                          return Text("Teste classe atualizarPostagem: Ok");
                        } else {
                          return Text("Teste classe atualizarPostagem: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: aumentarCurtidas(3),
                      builder: (context, projectSnap) {
                        atualizarPostagem(9, "https://i.imgur.com/4AiXzf8.jpg");
                        if (projectSnap.data == true) {
                          return Text("Teste classe aumentarCurtidas: Ok");
                        } else {
                          return Text("Teste classe aumentarCurtidas: N Ok");
                        }
                      }),
                  FutureBuilder(
                      future: diminuirCurtidas(3),
                      builder: (context, projectSnap) {
                        if (projectSnap.data == true) {
                          return Text("Teste classe diminuirCurtidas: Ok");
                        } else {
                          return Text("Teste classe diminuirCurtidas: N Ok");
                        }
                      }),                    
                ]))));
  }
}

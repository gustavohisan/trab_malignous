import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:trab_malignous/postagem.dart';
import 'dart:convert' as JSON;
import 'postagemCompleta.dart';
import 'teste.dart';

class PostagemImagem extends StatefulWidget {
  final String tipo;
  const PostagemImagem(this.tipo);
  @override
  State<StatefulWidget> createState() {
    return _PostagemImagem();
  }
}

class _PostagemImagem extends State<PostagemImagem> {
  bool botaoGostei = false;
  bool botaoNGostei = false;
  int likeCounter = 0;

  Teste teste = Teste(
    id: 1,
    completed: "https://correio-cdn2.cworks.cloud/fileadmin/_processed_/0/a/csm_00_Hitech_Electric_EcoTech_Carro_Eletrico_na_Bahia_Foto_Carol_Dantas_Divulgacao_a7ecc750cc.jpg",
    title: "testando",
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.03),
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: Icon(Icons.account_circle,
                        size: MediaQuery.of(context).size.width * 0.10,
                        color: Color.fromRGBO(112, 112, 112, 1)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            this.widget.tipo,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Text(
                              "Poublicado por xxxc",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.028),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: IconButton(
                      icon: Icon(Icons.more_horiz,
                          size: MediaQuery.of(context).size.width * 0.08,
                          color: Color.fromRGBO(112, 112, 112, 1)),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostagemCompleta(
                        teste: teste,
                      )));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.99,
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.05),
                      child: Text(
                        "Um Corgi",
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                    ),
                    Container(
                      child: Image.network(
                        "https://miro.medium.com/max/308/1*ovy6HGlyB5ls0VqpRqdZwA.png",
                        //width: MediaQuery.of(context).size.width * 0.99,
                        //height: MediaQuery.of(context).size.width * 0.95,
                        scale: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        size: MediaQuery.of(context).size.width * 0.075,
                        color: this.botaoGostei
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                      alignment: Alignment.centerRight,
                      color: Color.fromRGBO(112, 112, 112, 1),
                      onPressed: () {
                        //Precisa arrumar
                        setState(() {
                          if (!this.botaoGostei) {
                            this.botaoGostei = true;
                            this.botaoNGostei = false;
                            likeCounter++;
                          } else {
                            this.botaoGostei = false;
                            likeCounter--;
                          }
                        });
                      },
                    ),
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  Container(
                    child: Text(
                      likeCounter.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.035),
                    ),
                    width: MediaQuery.of(context).size.width * 0.14,
                  ),
                  // Container(
                  //   child: IconButton(
                  //       icon: Icon(
                  //         Icons.sentiment_dissatisfied,
                  //         size: 30,
                  //         color: this.botaoNGostei
                  //             ? Colors.red
                  //             : Color.fromRGBO(112, 112, 112, 1),
                  //       ),
                  //       alignment: Alignment.centerRight,
                  //       onPressed: () {
                  //         //Precisa arrumar
                  //         setState(() {
                  //           if (!this.botaoNGostei) {
                  //             this.botaoNGostei = true;
                  //             this.botaoGostei = false;
                  //             likeCounter--;
                  //           } else {
                  //             likeCounter++;
                  //             this.botaoNGostei = false;
                  //           }
                  //         });
                  //       },
                  //       color: Color.fromRGBO(112, 112, 112, 1)),
                  //   width: MediaQuery.of(context).size.width * 0.12,
                  // ),
                  Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.comment,
                          size: MediaQuery.of(context).size.width * 0.08,
                        ),
                        alignment: Alignment.centerRight,
                        onPressed: () {},
                        color: Color.fromRGBO(112, 112, 112, 1)),
                    width: MediaQuery.of(context).size.width * 0.60,
                  ),
                  Container(
                    child: Text(
                      "1000",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.035),
                    ),
                    width: MediaQuery.of(context).size.width * 0.10,
                  ),
                ],
              ),
            ],
          )),
    ]);
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trab_malignous/API/Api.dart';
import 'package:trab_malignous/Screens/postagemCompletaImagem.dart';
import '../Model/Postagem.dart';
import 'package:transparent_image/transparent_image.dart';

class PostagemImagem extends StatefulWidget {
  final Postagem postagem;
  PostagemImagem({Key key, @required this.postagem}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PostagemImagem();
  }
}

class _PostagemImagem extends State<PostagemImagem> {
  bool botaoGostei = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.025),
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.01,
                          right: MediaQuery.of(context).size.width * 0.01),
                      child: Container(
                          width: MediaQuery.of(context).size.height * 0.07,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      widget.postagem.fotoTopico)))),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: SelectableText(
                            this.widget.postagem.tituloTopico,
                            showCursor: true,
                            enableInteractiveSelection: true,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize: 20),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: SelectableText(
                              "publicado por " +
                                  this
                                      .widget
                                      .postagem
                                      .nomeUsuario, //Apartir do id buscar o usuario
                              showCursor: true,
                              enableInteractiveSelection: true,
                              dragStartBehavior: DragStartBehavior.down,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                  fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                  /*Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    child: IconButton(
                      icon: Icon(Icons.more_horiz,
                          size: MediaQuery.of(context).size.width * 0.04,
                          color: Color.fromRGBO(112, 112, 112, 1)),
                      onPressed: () => {},
                    ),
                  ),*/
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostagemCompletaImagem(
                                postagem: widget.postagem,
                              )));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.04),
                      child: Text(
                        this.widget.postagem.tituloPublicacao,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 32),
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          Center(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: widget.postagem.corpo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            size: 24,
                            color: this.botaoGostei
                                ? Colors.blue
                                : Color.fromRGBO(112, 112, 112, 1),
                          ),
                          alignment: Alignment.center,
                          color: Color.fromRGBO(112, 112, 112, 1),
                          onPressed: () {
                            setState(() {
                              if (!this.botaoGostei) {
                                avaliar(widget.postagem.id);
                                aumentarCurtidas(widget.postagem.id);
                                this.botaoGostei = true;
                              } else {
                                desavaliar(widget.postagem.id);
                                diminuirCurtidas(widget.postagem.id);
                                this.botaoGostei = false;
                              }
                            });
                          },
                        ),
                        width: 48,
                      ),
                      Container(
                        child: Text(
                          widget.postagem.quantAvaliacoes.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(                        
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.comment,
                              size: 24,
                            ),
                            alignment: Alignment.center,
                            onPressed: () {},
                            color: Color.fromRGBO(112, 112, 112, 1)),
                        width: 48,
                      ),
                      Container(
                        child: Text(
                          "1000",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ]);
  }
}

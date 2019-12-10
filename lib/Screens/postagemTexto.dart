import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trab_malignous/Screens/postagemCompletaTexto.dart';
import '../Model/Postagem.dart';
import 'package:trab_malignous/API/Api.dart';


class PostagemTexto extends StatefulWidget {
  final Postagem postagem;
  PostagemTexto({Key key, @required this.postagem}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PostagemTexto();
  }
}

class _PostagemTexto extends State<PostagemTexto> {
  bool botaoGostei = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.03),
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Container(
                        width: MediaQuery.of(context).size.height * 0.05,
                        height: MediaQuery.of(context).size.height * 0.05,
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
                        child: Text(
                          this.widget.postagem.tituloTopico,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 20),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "publicado por " +
                                this
                                    .widget
                                    .postagem
                                    .nomeUsuario, //Apartir do id buscar o usuario
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
                  width: MediaQuery.of(context).size.width * 0.10,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz,
                        size: MediaQuery.of(context).size.width * 0.08,
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
                        builder: (context) => PostagemCompletaTexto(
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
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Text(
                      this.widget.postagem.corpo,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromRGBO(112, 112, 112, 0.8),
                          fontSize: 24),
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
                                  widget.postagem.quantAvaliacoes++;
                                } else {
                                  desavaliar(widget.postagem.id);
                                  diminuirCurtidas(widget.postagem.id);
                                  this.botaoGostei = false;
                                  widget.postagem.quantAvaliacoes--;
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
        ));
  }
}

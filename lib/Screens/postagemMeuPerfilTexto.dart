import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:trab_malignous/Screens/postagemCompletaTexto.dart';
import 'package:trab_malignous/Screens/postagemMeuPerfilEditar.dart';
import '../Model/Postagem.dart';

class PostagemMeuPerfilTexto extends StatefulWidget {
  final Postagem postagem;
  PostagemMeuPerfilTexto({Key key, @required this.postagem}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PostagemMeuPerfilTexto();
  }
}

class _PostagemMeuPerfilTexto extends State<PostagemMeuPerfilTexto> {
  bool botaoGostei = false;

  @override
  Widget build(BuildContext context) {
    String dataConvertida = DateFormat('dd/MM/yyyy – kk:mm')
        .format(DateTime.parse(widget.postagem.data));
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
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          this.widget.postagem.tituloTopico,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            "publicado em " +
                                dataConvertida
                                    , //Apartir do id buscar o usuario
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostagemMeuPerfilEditar(
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
                          fontSize: MediaQuery.of(context).size.width * 0.06),
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
                          fontSize: MediaQuery.of(context).size.width * 0.04),
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
                      size: MediaQuery.of(context).size.height * 0.04,
                      color: this.botaoGostei
                          ? Colors.blue
                          : Color.fromRGBO(112, 112, 112, 1),
                    ),
                    alignment: Alignment.centerRight,
                    color: Color.fromRGBO(112, 112, 112, 1),
                    onPressed: () {
                      //Precisa arrumar
                      // setState(() {
                      //   if (!this.botaoGostei) {
                      //     this.botaoGostei = true;
                      //     likeCounter++;
                      //   } else {
                      //     this.botaoGostei = false;
                      //     likeCounter--;
                      //   }
                      // });
                    },
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Container(
                  child: Text(
                    widget.postagem.quantAvaliacoes.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w500),
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
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
                        size: MediaQuery.of(context).size.width * 0.09,
                      ),
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      color: Color.fromRGBO(112, 112, 112, 1)),
                  width: MediaQuery.of(context).size.width * 0.50,
                ),
                Container(
                  child: Text(
                    "1000",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

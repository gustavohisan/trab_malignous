import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Model/Postagem.dart';

class PostagemTexto extends StatefulWidget {
  final Postagem postagem;
   PostagemTexto({Key key, @required this.postagem}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
        return _PostagemTexto();
  }
}

class _PostagemTexto extends State<PostagemTexto>{
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
                          "Topico: " + widget.postagem.idTopico.toString(),
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
                            "Publicado por " + widget.postagem.idUsuario.toString(), //Apartir do id buscar o usuario
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.028),
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
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.99,
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                widget.postagem.titulo,
                softWrap: true,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.99,
              height: MediaQuery.of(context).size.width * 0.80,
              color: Colors.black12,
              child: Text(widget.postagem.corpo),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      size: 30,
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
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                Container(
                  child: Text(
                    widget.postagem.quantAvaliacoes.toString(),
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
        ));
  }
}

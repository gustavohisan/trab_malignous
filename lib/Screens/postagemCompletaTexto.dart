import 'package:flutter/material.dart';
import '../Model/Postagem.dart';
import 'package:intl/intl.dart';

class PostagemCompletaTexto extends StatefulWidget {
  final Postagem postagem;
  PostagemCompletaTexto({this.postagem});

  @override
  _PostagemCompletaTexto createState() {
    return _PostagemCompletaTexto();
  }
}

class _PostagemCompletaTexto extends State<PostagemCompletaTexto> {
  String _selecionadoOrdem;

  @override
  Widget build(BuildContext context) {
    String dataConvertida = DateFormat('dd/MM/yyyy – kk:mm')
        .format(DateTime.parse(widget.postagem.data));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: <Widget>[
                            new Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            widget.postagem.fotoTopico)))),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: Text(
                                      widget.postagem.tituloTopico,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(112, 112, 112, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: Text(
                                      "por " +
                                          widget.postagem.nomeUsuario +
                                          " as " +
                                          dataConvertida,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromRGBO(112, 112, 112, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              //Titulo da publicacao
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Text(
                    widget.postagem.tituloPublicacao,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
              ),
              Padding( padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
              child:  Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(widget.postagem.corpo,
                style: TextStyle(
                  color: Color.fromRGBO(112, 112, 112, 0.8),
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  letterSpacing: MediaQuery.of(context).size.width * 0.0015,
                ),),
              ),),
              //Informacoes da publicacao
              
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.02,
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      color: Color.fromRGBO(112, 112, 112, 1),
                      iconSize: MediaQuery.of(context).size.height * 0.033,
                      onPressed: () {},
                    ),
                    Text(
                      widget.postagem.quantAvaliacoes.toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: MediaQuery.of(context).size.height * 0.027,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: IconButton(
                          icon: Icon(
                            Icons.comment,
                            size: MediaQuery.of(context).size.width * 0.06,
                          ),
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          color: Color.fromRGBO(112, 112, 112, 1)),
                    ),
                    Text(
                      "1000",
                      style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: MediaQuery.of(context).size.height * 0.027,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  color: Colors.grey.shade300,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Comentários",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(112, 112, 112, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.25),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selecionadoOrdem,
                              onChanged: (String valor) {
                                setState(() {
                                  _selecionadoOrdem = valor;
                                });
                              },
                              //O texto que aparece dentro
                              hint: Text(
                                "Ordenar por",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                              //Os itens da dropdown, será sempre passado o value que seria o ID do topico
                              items: [
                                DropdownMenuItem(
                                  //Id
                                  value: "1",
                                  //Texto
                                  child: Text(
                                    "Melhores",
                                    //Aparencia
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                ),
                                //Mesma coisa q o de cima
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text(
                                    "Novos",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "3",
                                  child: Text(
                                    "Antigos",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Comentários indisponiveis no momento.",
                          style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                        ),
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: MediaQuery.of(context).size.width * 0.1,
                          color: Color.fromRGBO(112, 112, 112, 1),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

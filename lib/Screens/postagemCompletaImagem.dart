import 'package:flutter/material.dart';
import '../Model/Postagem.dart';
import 'informacaoUsuario.dart' as infoUsuario;
import 'package:photo_view/photo_view.dart';

class PostagemCompletaImagem extends StatefulWidget {
  final Postagem postagem;
  PostagemCompletaImagem({this.postagem});

  @override
  _PostagemCompletaImagem createState() {
    return _PostagemCompletaImagem();
  }
}

class _PostagemCompletaImagem extends State<PostagemCompletaImagem> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network(widget.postagem.corpo),
                //Titulo da publicacao
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Text(
                      widget.postagem.titulo,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
                //Informacoes da publicacao
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
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
                                              "https://i.imgur.com/BoN9kdC.png")))),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02),
                                child: Column(
                                  children: <Widget>[
                                    Text("publicado em " +
                                        widget.postagem.idTopico.toString()),
                                    Text(
                                      " por " +
                                          widget.postagem.idUsuario.toString() +
                                          " as " +
                                          widget.postagem.data,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),

                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    Text(widget.postagem.quantAvaliacoes.toString()),
                  ],
                )
              ],
            ),
          )
          /*
        PhotoView(
          imageProvider: NetworkImage(widget.postagem.corpo),
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
          ),
          enableRotation: false,
          minScale: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
        ),
        */
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

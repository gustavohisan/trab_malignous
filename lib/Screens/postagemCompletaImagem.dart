import 'package:flutter/material.dart';
import '../Model/Postagem.dart';
import 'informacaoUsuario.dart' as infoUsuario;
import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

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
    String dataConvertida = DateFormat('dd/MM/yyyy – kk:mm')
        .format(DateTime.parse(widget.postagem.data));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Center(child: CircularProgressIndicator()),
                    Center(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.postagem.corpo,
                      ),
                    ),
                  ],
                ),
                //Image.network(widget.postagem.corpo),
                //Titulo da publicacao
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
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
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text(
                                        widget.postagem.tituloTopico,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontWeight: FontWeight.w300,
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1),
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
                    )),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        color: Color.fromRGBO(112, 112, 112, 1),
                        iconSize: MediaQuery.of(context).size.height * 0.05,
                        onPressed: () {},
                      ),
                      Text(
                        widget.postagem.quantAvaliacoes.toString(),
                        style: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontSize: MediaQuery.of(context).size.height * 0.027,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: IconButton(
                            icon: Icon(
                              Icons.comment,
                              size: MediaQuery.of(context).size.width * 0.08,
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
                      color: Colors.grey,
                      child: Text(
                        "Comentários",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
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
}

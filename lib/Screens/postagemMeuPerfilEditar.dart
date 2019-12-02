import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trab_malignous/API/Api.dart';
import '../Model/Postagem.dart';

class PostagemMeuPerfilEditar extends StatefulWidget {
  final Postagem postagem;
  PostagemMeuPerfilEditar({Key key, @required this.postagem}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PostagemMeuPerfilEditar();
  }
}

class _PostagemMeuPerfilEditar extends State<PostagemMeuPerfilEditar> {
  final _chaveForm = GlobalKey<FormState>();
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = new TextEditingController(text: widget.postagem.corpo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Editar publicação",
              style: TextStyle(
                color: Color.fromRGBO(112, 112, 112, 1),
              ),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Titulo",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(112, 112, 122, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      widget.postagem.tituloPublicacao,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Corpo",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(112, 112, 112, 1),
                          fontWeight: FontWeight.w300,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Form(
                      key: _chaveForm,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey[300],
                          )),
                          //Mema coisa só que quando selecionado
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                        validator: (value) {
                          if (value == widget.postagem.corpo) {
                            return 'A publicação está igual';
                          }
                          return null;
                        },
                        maxLines: 6,
                        minLines: 5,
                        controller: myController,
                      ),
                    )),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.1),
                      child: Container(
                        child: FlatButton(
                          color: Colors.grey.shade100,
                          child: Text(
                            "Atualizar",
                            style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            if (_chaveForm.currentState.validate()) {
                              atualizarPostagem(
                                      widget.postagem.id, myController.text)
                                  .then((value) {
                                String texto;
                                if (value) {
                                  texto = "Atualizado com sucesso";
                                } else {
                                  texto = "Arquivado com sucesso";
                                }
                                Navigator.of(context).pop();
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // Retrieve the text the that user has entered by using the
                                      // TextEditingController.
                                      content: Text(texto),
                                    );
                                  },
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.2),
                      child: FlatButton(
                        color: Colors.grey.shade100,
                        child: Text(
                          "Arquivar",
                          style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          arquivarPostagem(widget.postagem.id).then((value) {
                            String texto;
                            if (value) {
                              texto = "Arquivado com sucesso";
                            } else {
                              texto = "Arquivado com sucesso";
                            }
                            Navigator.of(context).pop();
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  content: Text(texto),
                                );
                              },
                            );
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

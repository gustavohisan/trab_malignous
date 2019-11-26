import 'package:flutter/material.dart';
import 'informacaoUsuario.dart' as infoUsuario;

class Formulario extends StatefulWidget {
  @override
  _Formulario createState() {
    return _Formulario();
  }
}

class _Formulario extends State<Formulario> {
  TextEditingController _valorTexto = new TextEditingController();
  final _chaveForm = GlobalKey<FormState>();
  String _valorDropdown;
  String _valorTitulo;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.cyan,
                tabs: [
                  Tab(
                    text: "Texto",
                  ),
                  Tab(
                    text: "Imagem",
                  ),
                  Tab(text: "Video"),
                ],
              ),
              leading: IconButton(
                icon:
                    Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text("Nova Publicação",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  )),
            ),
            body: TabBarView(
              children: [
                Container(
                    child: Form(
                  key: _chaveForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.025,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: DropdownButtonFormField<String>(
                            validator: (String value) {
                              if (value?.isEmpty ?? true) {
                                return 'Selecione um tópico válido';
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey[300],
                              )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                            ),
                            hint: Text(
                              "Selecione o tópico",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text(
                                  "First",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.023,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text(
                                  "Second",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.023,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _valorDropdown = value;
                              });
                            },
                            value: _valorDropdown,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        width: MediaQuery.of(context).size.width * 0.96,
                        child: TextFormField(
                          cursorColor: Color.fromRGBO(112, 112, 112, 1),
                          decoration: InputDecoration(
                              hintText: "Digite o titulo",
                              hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.023,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey[300],
                              )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                          maxLength: 120,
                          maxLengthEnforced: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite um titulo válido';
                            }
                            _valorTitulo = value;
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        width: MediaQuery.of(context).size.width * 0.96,
                        child: TextFormField(
                          controller: _valorTexto,
                          cursorColor: Color.fromRGBO(112, 112, 112, 1),
                          decoration: InputDecoration(
                              hintText:
                                  "Digite o texto da publicação (opcional)",
                              hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.023,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey[300],
                              )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                          maxLength: 1000,
                          maxLengthEnforced: true,
                          maxLines: 7,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.65),
                        child: RaisedButton(
                          elevation: 0,
                          color: Colors.cyan,
                          onPressed: () {
                            if (_chaveForm.currentState.validate()) {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: Text(_valorTitulo +
                                        " " +
                                        _valorDropdown +
                                        " " +
                                        _valorTexto.text + " " + infoUsuario.idUsuario.toString()),
                                  );
                                },
                              );
                            }
                          },
                          child: Text("Publicar",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.023,
                            color: Colors.white,
                          ),),
                        ),
                      )
                    ],
                  ),
                )),
                Icon(Icons.directions_bike),
                JanelaVideo(),
              ],
            )),
      ),
    );
  }
}

class JanelaVideo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.sentiment_dissatisfied,
              size: 40,
              color: Color.fromRGBO(112, 112, 112, 1),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Em desenvolvimento. Desculpa.",
              style: TextStyle(
                color: Color.fromRGBO(112, 112, 112, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

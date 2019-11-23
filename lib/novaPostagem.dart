import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  @override
  _Formulario createState() {
    return _Formulario();
  }
}

class _Formulario extends State<Formulario> {
  final _chaveForm = GlobalKey<FormState>();

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
                    fontSize: 18,
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
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        width: MediaQuery.of(context).size.width * 0.96,
                        child: TextFormField(
                          cursorColor: Color.fromRGBO(112, 112, 112, 1),
                          decoration: InputDecoration(
                              hintText: "Digite o titulo",
                              hintStyle: TextStyle(
                                fontSize: 14,
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
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        width: MediaQuery.of(context).size.width * 0.96,
                        child: TextFormField(
                          cursorColor: Color.fromRGBO(112, 112, 112, 1),
                          decoration: InputDecoration(
                              hintText:
                                  "Digite o texto da publicação (opcional)",
                              hintStyle: TextStyle(
                                fontSize: 14,
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
                      RaisedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_chaveForm.currentState.validate()) {}
                          },
                          child: Text("Publicar"),
                        ),
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

import 'package:flutter/material.dart';
import 'novaPostagem.dart';

class Rodape extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rodape();
  }
}

class _Rodape extends State<Rodape> {
  bool clicadoHome = true;
  bool clicadoSeguindo = false;
  bool clicadoMeuPerfil = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                width: 0.3, color: Color.fromRGBO(211, 211, 211, 1))),
      ),
      height: MediaQuery.of(context).size.height * 0.08,
      child: BottomAppBar(
        elevation: 0,
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    clicadoHome = true;
                    clicadoMeuPerfil = false;
                    clicadoSeguindo = false;
                  });
                },
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.home,
                        size: MediaQuery.of(context).size.height * 0.05,
                        color: clicadoHome
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Text(
                      "Início",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.normal,
                        color: clicadoHome
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                  ],
                )),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    clicadoHome = false;
                    clicadoMeuPerfil = false;
                    clicadoSeguindo = true;
                  });
                },
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.group_add,
                        size: MediaQuery.of(context).size.height * 0.05,
                        color: clicadoSeguindo
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Text(
                      "Seguindo",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.normal,
                        color: clicadoSeguindo
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                    )
                  ],
                )),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Formulario()),
                  );
                },
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.create,
                        size: MediaQuery.of(context).size.height * 0.046,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "Publicar",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    clicadoHome = false;
                    clicadoMeuPerfil = true;
                    clicadoSeguindo = false;
                  });
                },
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.height * 0.05,
                        color: clicadoMeuPerfil
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Text(
                      "Meu perfil",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.normal,
                        color: clicadoMeuPerfil
                            ? Colors.blue
                            : Color.fromRGBO(112, 112, 112, 1),
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Footer();
  }
}
class _Footer extends State<Footer> {
  bool clicado = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                width: 0.3, color: Color.fromRGBO(211, 211, 211, 1))),
      ),
      height: 50,
      child: BottomAppBar(
        elevation: 0,
        child: ButtonTheme(
          minWidth: 80,
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () => setState(() => clicado = !clicado),
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color: clicado ? Color.fromRGBO(112, 112, 112, 1) : Colors.blue,
                      ),
                    ),
                    Text(
                      "Início",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                  ],
                )),
              ),
              FlatButton(
                onPressed: () => {},
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.group_add,
                        size: 30,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Text(
                      "Seguindo",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    )
                  ],
                )),
              ),
              FlatButton(
                onPressed: () => {},
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.create,
                        size: 28,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "Publicar",
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              FlatButton(
                onPressed: () => {},
                child: (Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    Text(
                      "Meu perfil",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(112, 112, 112, 1),
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
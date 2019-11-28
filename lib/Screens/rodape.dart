import 'package:flutter/material.dart';
import 'novaPostagem.dart';

class Rodape extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rodape();
  }
}

class _Rodape extends State<Rodape> {
  //Variaveis para verificar o rodape, começa sempre no home
  bool clicadoHome = true;
  bool clicadoSeguindo = false;
  bool clicadoMeuPerfil = false;

  @override
  Widget build(BuildContext context) {
    //Rodape ne
    return Container(
      //Decoração da borda de cima
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                width: 0.3, color: Color.fromRGBO(211, 211, 211, 1))),
      ),
      //Tamanho
      height: MediaQuery.of(context).size.height * 0.08,
      //O rodapé em si
      child: BottomAppBar(
        //Sem sombra
        elevation: 0,
        //Tema do botao, so serve pro tamanho
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            //Organiza em uma linha todos os botoes
            children: <Widget>[
              //Botao 1, home
              FlatButton(
                //Quando clicado muda a cor para azul, tem que mudar
                onPressed: () {
                  setState(() {
                    clicadoHome = true;
                    clicadoMeuPerfil = false;
                    clicadoSeguindo = false;
                  });
                },
                //Isso é o que ta dentro do botao,
                child: (Column(
                  children: <Widget>[
                    //Margem
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      //Icone
                      child: Icon(
                        Icons.home,
                        size: 30,
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

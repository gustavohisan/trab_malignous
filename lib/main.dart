import 'package:flutter/material.dart';
import 'Screens/postagemImagem.dart';
import 'Screens/postagemTexto.dart';
import 'Screens/rodape.dart';
import 'Screens/cabecalho.dart';
import 'package:flutter/services.dart';
import 'package:trab_malignous/API/Api.dart';
import 'Screens/meuPerfil.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final GlobalKey<RefreshIndicatorState> _recarregarInicioChave =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _recarregarMeuPerfilChave =
      new GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Isso aqui é a cor do cabeçalho e rodapé do android, não esquece de mudar no fim
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(112, 112, 112, 1), // Barra de baixo
      statusBarColor: Color.fromRGBO(112, 112, 112, 1), // Barra de cima
    ));
    return MaterialApp(
      //Nao aparecer debug
      debugShowCheckedModeBanner: false,
      title: 'BReddit',
      home: Scaffold(
          //Chama a construção do cabecalho
          appBar: Cabecalho(),
          //Corpo
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
            //List view para mostrar todos os topicos
            child: PageView(
              children: <Widget>[
                RefreshIndicator(
                  key: _recarregarInicioChave,
                  onRefresh: _recarregar,
                  child: FutureBuilder(
                      future: getPostagens(),
                      builder: (context, projectSnap) {
                        return projectSnap.hasData
                            ? ListView.builder(
                                itemCount: projectSnap.data.length,
                                //Scroll vertical
                                scrollDirection: Axis.vertical,
                                //Começa a criação
                                itemBuilder: (BuildContext ctxt, int index) {
                                  if (projectSnap.data[index].tipo
                                          .compareTo('texto') ==
                                      0) {
                                    return Container(
                                      child: PostagemTexto(
                                          postagem: projectSnap.data[index]),
                                    );
                                  } else {
                                    return Container(
                                      child: PostagemImagem(
                                          postagem: projectSnap.data[index]),
                                    );
                                  }
                                })
                            : Center(child: CircularProgressIndicator());
                      }),
                ),
                RefreshIndicator(
                  key: _recarregarMeuPerfilChave,
                  onRefresh: _recarregar,
                  child: MeuPerfil(),
                )
              ],
            ),
          ),
          //Criação do rodape
          bottomNavigationBar: Rodape(),
          //Cor de fundo do programa
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.98)),
    );
  }

  Future<Null> _recarregar() async {
    setState(() => MyApp);
  }
}

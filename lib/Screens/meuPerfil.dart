import 'package:flutter/material.dart';
import '../Screens/postagemMeuPerfilImagem.dart';
import '../Screens/postagemMeuPerfilTexto.dart';
import 'package:trab_malignous/API/Api.dart';

class MeuPerfil extends StatefulWidget {
  @override
  _MeuPerfil createState() {
    return _MeuPerfil();
  }
}

class _MeuPerfil extends State<MeuPerfil> {
  @override
  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMinhasPublicacoes(),
      builder: (context, projectSnap) {
        return projectSnap.hasData
            ? ListView.builder(
                itemCount: projectSnap.data.length,
                //Scroll vertical
                scrollDirection: Axis.vertical,
                //Começa a criação
                itemBuilder: (BuildContext ctxt, int index) {
                  if (projectSnap.data[index].tipo.compareTo('texto') == 0) {
                    return Container(
                      child: PostagemMeuPerfilTexto(
                          postagem: projectSnap.data[index]
                      ),
                    );
                  } else {
                    return Container(
                      child: PostagemMeuPerfilImagem(
                          postagem: projectSnap.data[index]
                      ),
                    );
                  }
                }
              )
            : Center(child: CircularProgressIndicator());
      });
  }
}

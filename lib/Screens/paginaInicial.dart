import 'package:flutter/material.dart';
import '../Screens/postagemImagem.dart';
import '../Screens/postagemTexto.dart';
import 'package:trab_malignous/API/Api.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicial createState() {
    return _PaginaInicial();
  }
}

class _PaginaInicial extends State<PaginaInicial> {
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
      future: getPostagens(),
      builder: (context, projectSnap) {
        return projectSnap.hasData
          ? //DraggableScrollbar.rrect(
            //controller: _rrectController,
            Scrollbar(
            child: ListView.builder(
              itemCount: projectSnap.data.length,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width * 0.25),
              //Scroll vertical
              scrollDirection: Axis.vertical,
              //Começa a criação
              itemBuilder: (BuildContext context, int index) {
                if (projectSnap.data[index].tipo.compareTo('texto') == 0) {
                  return Container(
                    child: PostagemTexto(
                      postagem: projectSnap.data[index]
                    ),
                  );
                } else {
                  return Container(
                    child: PostagemImagem(
                      postagem: projectSnap.data[index]
                    ),
                  );
                }
              }
            )
          )
          : Center(child: CircularProgressIndicator());
      }
  );
  }
}

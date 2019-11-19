import 'package:flutter/material.dart';

//Stateless ja que nao tem mudança, prefferedsizewidget porque é obrigatório
class Header extends StatelessWidget with PreferredSizeWidget {
  //Tudo ai em baixo é o cabeçalho
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthCaixaTexto = width * 0.75;
    double widthIcone = width * 0.1;
    return Container(
        height: 70, //Tamanho do cabeçalho
        child: AppBar(
          //Criação da appBar
          title: Row(
            //Alinhar em colunas
            children: <Widget>[
              //Conteudo das colunas
              //Icone Perfil
              Container(
                //Posição
                transform: Matrix4.translationValues(-8, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  iconSize: widthIcone,
                  color: Color.fromRGBO(112, 112, 112, 1),
                  onPressed: () {
                    return null;
                  },
                ),
              ),
              //Barra de pesquisa
              Container(
                //Altura e largura da caixa de texto
                width: widthCaixaTexto,
                height: 35,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
                child:
                   TextField(
                     
                     cursorColor: Colors.black,
                     cursorWidth: 1,
                  //Fonte do texto
                  style: TextStyle(
                    fontSize: 13,
                    height: 3.2,
                  ),
                  decoration: InputDecoration(     
                    border: InputBorder.none,
                    //Placeholder
                    hintText: "Pesquisar",
                    hintStyle: TextStyle
                    (
                      height: 1,
                    ),
                    //Icone dentro da textobox
                    prefixIcon: Icon(
                        Icons.search,
                        size: 22,
                        color: Color.fromRGBO(112, 112, 112, 1),
                    )
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          //Remove a sombra de baixo
          elevation: 0,
        ));
  } //Ate aqui era o cabeçalho

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

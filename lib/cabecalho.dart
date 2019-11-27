import 'package:flutter/material.dart';

//Stateless ja que nao tem mudança, prefferedsizewidget porque é obrigatório
class Cabecalho extends StatelessWidget with PreferredSizeWidget {
  //Tudo ai em baixo é o cabeçalho
  @override
  Widget build(BuildContext context) {
    //Variaveis para guardar coisas inuteis na real que eu nem uso direito porém é mais recomendado usar
    double width = MediaQuery.of(context).size.width;
    double widthCaixaTexto = width * 0.75;
    double widthIcone = width * 0.1;
    //Retorna o cabeçalho
    return Container(
        height: MediaQuery.of(context).size.height * 0.115, //Tamanho do cabeçalho
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
                //Icone do perfil, clicavel nao faz nada
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  iconSize: widthIcone,
                  color: Color.fromRGBO(112, 112, 112, 1),
                  //Aqui ficaria o perfil se tivesse n tem
                  onPressed: () {
                    return null;
                  },
                ),
              ),
              //Barra de pesquisa
              Container(
                //Altura e largura da caixa de texto
                width: widthCaixaTexto,
                height: MediaQuery.of(context).size.height * 0.057,
                //Decoração
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
                child:
                //Barra de pesquisa
                   TextField(
                     //Cores o grossura da barrinha que aparece quando voce clica para digitar
                     cursorColor: Colors.black,
                     cursorWidth: 1,
                  //Fonte do texto
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                  decoration: InputDecoration(     
                    border: InputBorder.none,
                    //Placeholder
                    hintText: "Pesquisar",
                    hintStyle: TextStyle
                    (
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    //Icone dentro da textobox
                    prefixIcon: Icon(
                        Icons.search,
                        size: MediaQuery.of(context).size.height * 0.035,
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
  //No caso de appbars sempre é necessario o preferredSize, ou se pode utilizar o AppBar direto, porém nao pensei nisso na hora e ja fiz
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

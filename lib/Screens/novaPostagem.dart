import 'package:flutter/material.dart';
import 'package:trab_malignous/API/Api.dart';
import 'package:trab_malignous/Model/Topicos.dart';
import 'informacaoUsuario.dart' as infoUsuario;

class Formulario extends StatefulWidget {
  @override
  _Formulario createState() {
    return _Formulario();
  }
}

class _Formulario extends State<Formulario> {
  //Essa variavel é para pegar o texto dentro da text field que não tem validator
  TextEditingController _valorTexto = new TextEditingController();
  //Essa é o valor da chave do form, não sei pra que q serve
  final _chaveForm = GlobalKey<FormState>();
  //O valor do id do item dropdown button
  String _valorDropdown;
  //O valor da string titulo
  String _valorTitulo;

  @override
  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      //Nao mostra debug
      debugShowCheckedModeBanner: false,
      //Default tab pra ter as 3 opções de criação de postagem, texto, imagem ou video
      home: DefaultTabController(
        //Tamanho 3 duh
        length: 3,
        //Começa a criação do app
        child: Scaffold(
          appBar: AppBar(
            //Criamos a tab bar
            bottom: TabBar(
              //Definimos as cores
              indicatorColor: Colors.black,
              //Tem que mudar isso
              labelColor: Colors.cyan,
              //As tabs em si
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
            //Botao de fechar, se precisar sempre copiar e colar esse que funciona para qualquer contexto
            leading: IconButton(
              icon: Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            //Nao aparecer sombra no appbar
            elevation: 0,
            backgroundColor: Colors.white,
            //Titulo da publicação duh
            title: Text("Nova Publicação",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Color.fromRGBO(112, 112, 112, 1),
                )),
          ),
          //Começa o corpo, cada children do tabview aparecerá em um diferente, por isso precisa ter exatamente 3
          body: FutureBuilder(
              future: getTopicos(),
              builder: (context, projectSnap) {
                if (projectSnap.hasData) {
                  //funcionando
                  var lista = new List();
                  lista = projectSnap.data
                      .map((Topicos elemento) => elemento.titulo.toString())
                      .toList();
                  return TabBarView(
                    children: [
                      //Primeira parte, o de texto
                      Container(
                          //Cria o formulario
                          child: Form(
                        key: _chaveForm,
                        //Alinhar em coluna
                        child: Column(
                          //Bota no canto superior esquerdo acho sei la
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Padding é tipo margin
                            Padding(
                              //Margem no topo, na esqueda e em baixo
                              padding: EdgeInsets.only(
                                  //MediaQuery serve pra vc pegar o tamanho da tela ai vc multiplica pela porcentagem da tela que vc quer, isso ajuda para telas com tamanhos diferentes
                                  left:
                                      MediaQuery.of(context).size.width * 0.025,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.01,
                                  top: MediaQuery.of(context).size.height *
                                      0.01),
                              child: Container(
                                //Agora começa mesmo o form, com o dropdownbutton
                                width: MediaQuery.of(context).size.width * 0.95,
                                child:
                                    DropdownButtonFormField<dynamic>(
                                  // Validador do dropdown, se estiver vazio retorna a falha e nao envia
                                  validator: (dynamic value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Selecione um tópico válido';
                                    }
                                    return null;
                                  },
                                  //Decoração
                                  decoration: InputDecoration(
                                    //Muda a linha de baixo para cinza
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey[300],
                                    )),
                                    //Mema coisa só que quando selecionado
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                  ),
                                  //O texto que aparece dentro
                                  hint: Text(
                                    "Selecione o tópico",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                  ),
                                  items:
                                      //Os itens da dropdown, será sempre passado o value que seria o ID do topico
                                      lista.map((items) {
                                    // print(lista.join());
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.023)),
                                    );
                                  }).toList(),
                                  // : null,
                                  //Quando for selecionado algo mudar o valor da variavel para o que foi selecionado
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      _valorDropdown = value;
                                    });
                                  },
                                  //Sempre que voce selecionar algo, o valor de dentro muda para o da selecao
                                  value: _valorDropdown,
                                ),
                              ),
                            ),
                            //Textbox do titulo
                            Container(
                              //Margem pra esquerda pra nao ficar grudado
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03),
                              //Tamanho
                              width: MediaQuery.of(context).size.width * 0.96,
                              //A caixa de texto em si
                              child: TextFormField(
                                //Cor da barra de escrever
                                cursorColor: Color.fromRGBO(112, 112, 112, 1),
                                //Decoraçao
                                decoration: InputDecoration(
                                    //Texto de dentro
                                    hintText: "Digite o titulo",
                                    //Tamanho da letra
                                    hintStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    //Muda cor da linha
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey[300],
                                    )),
                                    //denovo
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                //Tamanho maximo do titulo
                                maxLength: 120,
                                //Tem tamanho maximo
                                maxLengthEnforced: true,
                                //Se tiver vazio nao deixa enviar, senao armazena na variavel
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Digite um titulo válido';
                                  }
                                  _valorTitulo = value;
                                  return null;
                                },
                              ),
                            ),
                            //Caixa de texto do corpo da publicação
                            Container(
                              //bla bla
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03),
                              width: MediaQuery.of(context).size.width * 0.96,
                              child: TextFormField(
                                //Controller utilizado para pegar a informação de dentro da caixa de texto
                                controller: _valorTexto,
                                //bla bla
                                cursorColor: Color.fromRGBO(112, 112, 112, 1),
                                decoration: InputDecoration(
                                    hintText:
                                        "Digite o texto da publicação (opcional)",
                                    hintStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey[300],
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                //Tamanho maximo
                                maxLength: 1000,
                                maxLengthEnforced: true,
                                //Numero de linhas que vai aparecer, tenho que diminuir acho sei la
                                maxLines: 7,
                              ),
                            ),
                            //Botao enviar
                            Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.65),
                              child: RaisedButton(
                                //tira sombra
                                elevation: 0,
                                //cor tem que mudar
                                color: Colors.cyan,
                                //funcao quando clicado
                                onPressed: () {
                                  //se for invalidado o estado da chave do formulario, isso quer dizer se os validator retornarem corretamente
                                  if (_chaveForm.currentState.validate() &&
                                      _valorTitulo.isNotEmpty &&
                                      _valorDropdown.isNotEmpty) {
                                    print(_valorTexto.toString());
                                    return postTexto(
                                        _valorTitulo,
                                        _valorTexto.text,
                                        _valorDropdown,
                                        infoUsuario.idUsuario);
                                  }
                                },
                                //Texto do butao
                                child: Text(
                                  "Publicar",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.023,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      //Formularios otro
                      Icon(Icons.directions_bike),
                      JanelaVideo(),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}

//Janela do video que nao foi feita
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

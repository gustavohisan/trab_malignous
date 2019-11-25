import 'package:flutter/material.dart';
import 'package:trab_malignous/rodape.dart';
import 'package:trab_malignous/cabecalho.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(74, 65, 42, 1), // Barra de baixo
      statusBarColor: Colors.purple[300], // Barra de cima
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BReddit',
      home: Scaffold(
        appBar: Cabecalho(),
        body: buildBody(),
        bottomNavigationBar: Rodape(),
      ),
    );
  }
}

Widget buildBody() {
  return new SingleChildScrollView(
      child: Column(
    children: <Widget>[
      Container(
        child: DropdownButton<String>(
                  items: [
          DropdownMenuItem(
            value: "1",
            child: Text(
              "First",
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Text(
              "Second",
            ),
          ),
        ],
        ),
      ),
    ],
  ));
}

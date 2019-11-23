import 'package:flutter/material.dart';
import 'package:trab_malignous/rodape.dart';
import 'package:trab_malignous/cabecalho.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
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

Widget buildBody()
{
  return new Center(
      child: Image.network('https://pm1.narvii.com/6387/4ce55e1b5f8710cf8ffafd339fb9a2eba9d10ed1_hq.jpg'),
      
    );
}

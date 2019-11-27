import 'package:flutter/material.dart';
import 'informacaoUsuario.dart' as infoUsuario;

class PostagemCompleta extends StatefulWidget {
  @override
  _PostagemCompleta createState() {
    return _PostagemCompleta();
  }
}

class _PostagemCompleta extends State<PostagemCompleta> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.close, color: Color.fromRGBO(112, 112, 112, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}

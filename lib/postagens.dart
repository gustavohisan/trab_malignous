import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Postagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.03),
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Icon(Icons.account_circle,
                      size: 40, color: Color.fromRGBO(112, 112, 112, 1)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Title Corgi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 15),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            "Poublicado por xxxc",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize: 10),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () => AlertDialog(content: Text("aaaaa")),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.1),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                "Um Corgi muito fofinho",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Image.network(
                "https://i.imgur.com/jdTOY2j.jpg",
                width: MediaQuery.of(context).size.width * 0.99,
                height: MediaQuery.of(context).size.width * 0.95,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.sentiment_satisfied,
                      size: 30,
                    ),
                    alignment: Alignment.centerRight,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                Container(
                  child: Text(
                    "1000",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: 15),
                  ),
                  width: MediaQuery.of(context).size.width * 0.14,
                ),
                Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.sentiment_dissatisfied,
                        size: 30,
                      ),
                      alignment: Alignment.centerRight,
                      color: Color.fromRGBO(112, 112, 112, 1)),
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.comment,
                        size: 30,
                      ),
                      alignment: Alignment.centerRight,
                      color: Color.fromRGBO(112, 112, 112, 1)),
                  width: MediaQuery.of(context).size.width * 0.60,
                ),
              ],
            ),
          ],
        ));
  }
}

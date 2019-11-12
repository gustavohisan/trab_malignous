import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(-10.0),
        child: AppBar(
          title: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  iconSize: 36,
                  color: Color.fromRGBO(112, 112, 112, 1),
                  onPressed: () {
                    return null;
                  },
                ),
              ),
              Container(
                width: 200,
                height: 30,
                margin: EdgeInsets.only(left: 15),
                child: TextField(
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(245, 245, 245, 1),
                          width: 0.0,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(245, 245, 245, 1),
                      hintText: "Pesquisar",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      )),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

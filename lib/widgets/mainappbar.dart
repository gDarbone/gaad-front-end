import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(60);
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: Text(
          "Olá Fulano, Bem-Vindo",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromRGBO(35, 100, 128, 1),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          child: ClipOval(
            child: Image.asset('assets/logo gaad.png'),
          ),
        )
      ],
    );
  }
}

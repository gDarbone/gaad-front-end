import 'package:flutter/material.dart';

class SideMenuBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.help, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                    SizedBox(width: 10),
                    Text("Ajuda",
                        style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                  ],
                )),

            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                    SizedBox(width: 10),
                    Text("Sobre",
                        style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Color.fromRGBO(35, 100, 128, 1), size: 20),
                    SizedBox(width: 10),
                    Text("Sair",
                        style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1), fontSize: 20))
                  ],
                ))
          ],

        ),
      ),
    );
  }
}

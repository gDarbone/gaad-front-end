import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/AddContact.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';

class ContatosPage extends StatelessWidget {
  String numero1 = '123123123';
  String numero2 = '789789789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,

      body: Scaffold(
        appBar: AppBar(
          title: Text('Contatos'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Gabriel Darbone',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                numero1,
                style: TextStyle(fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Adryen Simões',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                numero2,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Material(
              child: InkWell(
                splashColor: Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                highlightColor:
                    Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContact(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    color: Colors.blueAccent,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

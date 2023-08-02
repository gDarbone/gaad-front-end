import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/AddContact.dart';
import '../widgets/EditContact.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';

class RelatorioViewContatosEmergencia extends StatelessWidget {
  String numero1 = '123123123';
  String numero2 = '789789789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,

      body: Scaffold(
        appBar: AppBar(
          title: Text('Contatos de Emergência'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),

        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "Visualize os Contatos de Emergencia do Paciente",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:20, left: 10, right: 0),
                  child: Text(
                    'Gabriel Darbone',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 167, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditContact(),
                        ),
                      );
                    },
                    child: Icon(Icons.panorama_fish_eye),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 0),
                  child: Text(
                    'Gabriel Silva',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditContact(),
                        ),
                      );
                    },
                    child: Icon(Icons.panorama_fish_eye),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

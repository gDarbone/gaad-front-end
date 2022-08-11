import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/EditProfilePage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/AddContact.dart';
import '../widgets/EditContact.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'RelatorioViewComplicacoes.dart';

class ResultadoIdentificaPaciente extends StatelessWidget {
  String numero1 = '123123123';
  String numero2 = '789789789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,

      body: Scaffold(
        appBar: AppBar(
          title: Text('Resultados da Busca'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),

        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                "Selecione um Perfil e Visualize o Relatório Medico",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:10, left: 10, right: 0),
                  child: Text(
                    'Adryen Simões',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RelatorioViewComplicacoes(),
                        ),
                      );
                    },
                    child: Icon(Icons.medical_information),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                    child: Icon(Icons.person),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:10, left: 10, right: 0),
                  child: Text(
                    'Gabriel Darbone',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RelatorioViewComplicacoes(),
                        ),
                      );
                    },
                    child: Icon(Icons.medical_information),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                    child: Icon(Icons.person),
                  ),
                ),
              ],
            ),
            /*Material(
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
            ),*/
          ],
        ),
      ),
    );
  }
}

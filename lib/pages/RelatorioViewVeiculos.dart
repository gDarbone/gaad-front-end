import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/IdentificacaoPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';

import '../widgets/AddVeiculo.dart';
import '../widgets/EditVeiculo.dart';
import '../widgets/TokenCpfCard.dart';
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'RelatorioPage.dart';

class RelatorioViewVeiculos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,

      body: Scaffold(
        appBar: AppBar(
          title: Text('Veiculos Paciente'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),

        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "visualize os Veiculos do Paciente",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(35, 100, 128, 1)),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:20, left: 10, right: 0),
                  child: Text(
                    'Honda CG 160',
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
                          builder: (context) => EditVeiculo(),
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
                    'Yahama Fazer FZ25',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150, right: 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditVeiculo(),
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

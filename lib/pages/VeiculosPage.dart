import 'package:flutter/material.dart';
import 'package:gaad_mobile/pages/IdentificacaoPage.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioBar.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';

import '../widgets/AddVeiculo.dart';
import '../widgets/EditVeiculo.dart';
import '../widgets/TokenCpfCard.dart';
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'RelatorioPage.dart';

class VeiculosPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,

      body: Scaffold(
        appBar: AppBar(
          title: Text('Meus Veiculos'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),

        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "Edite ou visualize seus Veiculos",
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
                    child: Icon(Icons.edit),
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
                    child: Icon(Icons.edit),
                  ),
                ),
              ],
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
                      builder: (context) => AddVeiculo(),
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

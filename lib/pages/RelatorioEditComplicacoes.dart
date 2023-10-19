import 'package:flutter/material.dart';
import 'package:gaad_mobile/widgets/ComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioBar.dart';
import 'package:gaad_mobile/widgets/RelatorioComplicacoesCard.dart';
import 'package:gaad_mobile/widgets/RelatorioRemediosCard.dart';
import 'package:gaad_mobile/widgets/RelatorioVacinasCard.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';

import '../widgets/EditComplicacoesCard.dart';
import '../widgets/RelatorioEditBar.dart';
import '../widgets/RelatorioViewBar.dart';
import '../widgets/sidemenubar.dart';
import 'CategoryListPage.dart';
import 'RelatorioPage.dart';

class RelatorioEditComplicacoes extends StatelessWidget {

  Widget typeCard = ComplicacoesCard();
  Map<String, dynamic> responseUsuarioLogado = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Complicações'),
        backgroundColor: Color.fromRGBO(35, 100, 128, 1),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        /*decoration: BoxDecoration(
            color: Colors.white
        ),*/

        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  //padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                  height: 500,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding:
                          EdgeInsets.only(top: 5, left: 5, right: 5),

                          child: EditComplicacoesCard(
                            //onCardClick: () {},
                          ),

                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              color: Colors.white,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Material(

                    color: Colors.transparent,
                    child: InkWell(
                      splashColor:
                      Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      highlightColor:
                      Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      onTap: () => Navigator.pop(context, false),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 57.0),
                        child: Text(
                          'Cancelar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(35, 100, 128, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                            border: Border.all(
                                color: Color.fromRGBO(35, 100, 128, 1),
                                width: 2)),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(

                      splashColor:
                      Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      highlightColor:
                      Color.fromRGBO(35, 100, 128, 1).withOpacity(0.2),
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Salvo com Sucesso."),
                          content: Text(
                              "Suas alterações foram salvas com sucesso, você será redirecionado para a tela principal."),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryListPage(responseUsuarioLogado),
                                  ),
                                ),
                                child: Text("Ok"))
                          ],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 50.0),
                        child: Text(
                          'Salvar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(35, 100, 128, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                            border: Border.all(
                                color: Color.fromRGBO(35, 100, 128, 1),
                                width: 2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 80,
              child: RelatorioEditBar()
          ),

        ],
      ),
    );
  }
}

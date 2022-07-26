import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';
import 'package:gaad_mobile/pages/TokenCpfPage.dart';

import '../helpers/utils.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'IdentificacaoFacialPage.dart';
import 'RelatorioViewComplicacoes.dart';

class IdentificacaoPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meios de Identificação'),
          backgroundColor: Color.fromRGBO(35, 100, 128, 1),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(35, 100, 128, 1),
                  Color.fromRGBO(5, 181, 183, 1),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                  "Atualize ou visualize suas opções de Reconhecimento",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        padding: EdgeInsets.only(top: 5, left: 50, right: 50),
                        height: 300,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(top: 50, left: 5, right: 5),
                                child: CategoryCard(
                                  category: categories[3],
                                  onCardClick: () {
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 90, right: 90),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TokenCpfPage(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.numbers,
                                    color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Token e CPF",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IdentificacaoFacialPage(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.face_unlock_outlined, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Facial",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ],
                            ),
                          ),

                        ],
                      ),
                    )),
              ],
            )));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';

import '../helpers/utils.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'RelatorioEditComplicacoes.dart';
import 'RelatorioViewComplicacoes.dart';

class RelatorioPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Relatórios'),
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
                    "Edite ou visualize seus Relatórios",
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
                                  category: categories[1],
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
                                  builder: (context) => RelatorioViewComplicacoes(),
                              ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.view_list,
                                    color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Visualizar Relatório",
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
                                    builder: (context) => RelatorioAddComplicacoes(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Adicionar Itens",
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
                                    builder: (context) => RelatorioEditComplicacoes(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Text("Editar Relatório",
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

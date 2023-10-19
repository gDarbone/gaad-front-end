import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/pages/RelatorioAddComplicacoes.dart';
import 'package:provider/provider.dart';
import '../helpers/utils.dart';
import '../services/categoryselectionservice.dart';
import '../widgets/categorycard.dart';
import '../widgets/categoryicon.dart';
import '../widgets/mainappbar.dart';
import '../widgets/sidemenubar.dart';
import 'RelatorioEditComplicacoes.dart';
import 'RelatorioViewComplicacoes.dart';

class CategoryListPageMedico extends StatelessWidget {
  List<Category> categories = Utils.getMedicalMockedCategories();
  Utils util = new Utils();
  Map<String, dynamic> responseUsuarioLogado = {};
  CategoryListPageMedico(this.responseUsuarioLogado);


  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);

    return Scaffold(
        drawer: Drawer(
          child: SideMenuBar(),
        ),
        appBar: MainAppBar(),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(this.categories.length, (index) {
                        return CategoryCard(
                          category: categories[index],
                          onCardClick: () {
                            var subCat = this.categories[index];
                            catSelection.selectedCategory = this.categories[index];
                            var RotaTela = util.ControleTela(subCat.name);

                            Navigator.of(context).pushNamed(RotaTela, arguments: responseUsuarioLogado);
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ],
            )));
  }
}

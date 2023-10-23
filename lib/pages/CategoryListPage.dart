import 'package:flutter/material.dart';
import 'package:gaad_mobile/services/categoryselectionservice.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:gaad_mobile/widgets/sidemenubar.dart';
import 'package:provider/provider.dart';
import '../helpers/utils.dart';
import '../models/category.dart';
import '../widgets/categorycard.dart';
import 'package:url_launcher/url_launcher.dart';



class CategoryListPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategories();
  Utils util = new Utils();
  Map<String, dynamic> responseUsuarioLogado = {};
  String username = '';
  String password = '';
  CategoryListPage(this.responseUsuarioLogado, this.username, this.password);

  @override
  Widget build(BuildContext context){
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
        child: Stack(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  //padding: EdgeInsets.only(bottom: 2),
                  crossAxisCount: 2,
                  children: List.generate(
                      this.categories.length, (index) {
                    return CategoryCard(
                      category: categories[index],
                      onCardClick: () {
                        var subCat = this.categories[index];
                        catSelection.selectedCategory = this.categories[index];
                        var RotaTela = util.ControleTela(subCat.name);
                        Navigator.of(context).pushNamed(RotaTela, arguments:
                        {
                              'responseUsuarioLogado': responseUsuarioLogado,
                              'username': username,
                              'password': password,
                            });
                      },
                    );
                  }),
                ),
              ),
            ),
            /*Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CategoryBottomBar(),
            )*/
          ],
        ),
      ]),
    ),
    );
  }

}

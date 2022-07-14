import 'package:flutter/material.dart';
import 'package:gaad_mobile/services/categoryselectionservice.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:gaad_mobile/widgets/sidemenubar.dart';
import 'package:provider/provider.dart';
import '../helpers/utils.dart';
import '../models/category.dart';
import '../widgets/categorycard.dart';


class CategoryListPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategories();

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Olá, bem vindo, Selecione uma opção do Menu:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(35, 100, 128, 1),
                ),
              ),
            )*/
            /*Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 120),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {*/
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(bottom: 50),
                crossAxisCount: 2,
                children: List.generate(
                    this.categories.length, (index) {
                  return CategoryCard(
                    category: categories[index],
                    onCardClick: () {
                      var subCat = this.categories[index];
                      catSelection.selectedCategory = this.categories[index];
                      var RotaTela = ControleTela(subCat.name);

                      Navigator.of(context).pushNamed(RotaTela);
                    },
                  );
                }),
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

  String ControleTela(var SubCategoriaSelecionada) {
    var RotaTela = '/welcomepage';
    switch (SubCategoriaSelecionada) {
      case "Perfil":
        RotaTela = '/PerfilPage';
        break;
      case "Relatórios":
        RotaTela = '/PerfilPage';
        break;
      case "Contatos":
        RotaTela = '/CadastroPageOne';
        break;
      case "Identificação":
        RotaTela = '/CadastroPageTwo';
        break;
      case "Configuração":
        RotaTela = '/CadastroPageThree';
        break;
      case "Pedir Socorro":
        RotaTela = '/loginpage';
        break;
    }

    return RotaTela;
  }
}

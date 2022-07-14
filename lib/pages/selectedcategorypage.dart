import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/models/subcategory.dart';
import 'package:gaad_mobile/pages/detailspage.dart';
import 'package:gaad_mobile/widgets/categoryicon.dart';
import 'package:provider/provider.dart';

import '../services/categoryselectionservice.dart';
import '../widgets/mainappbar.dart';

class SelectedCategoryPage extends StatelessWidget {
  Category? selectedCategory;

  SelectedCategoryPage({this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;

    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryIcon(
                  color: /*this.selectedCategory!.color*/ Colors.white,
                  iconName: this.selectedCategory!.icon),
              SizedBox(width: 10, height: 150),
              Text(this.selectedCategory!.name!,
                  style: TextStyle(
                      color: /*this.selectedCategory!.color*/ Color
                          .fromRGBO(35, 100, 128, 1),
                      fontSize: 20))
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  this.selectedCategory!.subCategories!.length, (index) {
                return GestureDetector(
                  onTap: () {
                    var subCat = this.selectedCategory!.subCategories![index];
                    catSelection.selectedSubCategory = subCat as SubCategory?;

                    // Metodo para controle de Rotas das Telas de Subcategorias
                    var RotaTela = ControleTela(subCat.name);

                    Navigator.of(context).pushNamed(RotaTela);
                  },
                  child: Container(
                      child: Column(
                    children: [
                      ClipOval(
                        child: /*Image.asset("assets/logo gaad.png",
                              fit: BoxFit.cover, width: 100, height: 100)),
                              SizedBox(height: 10),*/
                            Icon(Icons.favorite,
                                color: Color.fromRGBO(35, 100, 128, 1),
                                size: 50),
                      ),
                      Text(this.selectedCategory!.subCategories![index].name!,
                          style:
                              TextStyle(color: Color.fromRGBO(35, 100, 128, 1)))
                    ],
                  )),
                );
              }),
            ),
          )
        ],
      )),
    );
  }

  String ControleTela(var SubCategoriaSelecionada) {
    var RotaTela = '/welcomepage';
    switch (SubCategoriaSelecionada) {
      case "Meus Dados":
        RotaTela = '/detailspage';
        break;
      case "Meu Token":
        RotaTela = '/detailspage';
        break;
      case "Excluir Conta":
        RotaTela = '/CadastroPageOne';
        break;
      case "Alterar Senha":
        RotaTela = '/welcomepage';
        break;
    }

    return RotaTela;
  }
}

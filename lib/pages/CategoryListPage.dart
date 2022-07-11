import 'package:flutter/material.dart';
import 'package:gaad_mobile/helpers/iconhelper.dart';
import 'package:gaad_mobile/pages/selectedcategorypage.dart';
import 'package:gaad_mobile/widgets/categorybottombar.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';

import '../helpers/utils.dart';
import '../models/category.dart';
import '../widgets/categoryicon.dart';
import '../widgets/categorycard.dart';
import '../widgets/iconfont.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: MainAppBar(),
      body: Container(
        child: Stack(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Olá, bem vindo, Selecione uma opção do Menu:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(35, 100, 128, 1),
                ),
              ),
            ),
            /*Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 120),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {*/
            SizedBox(height: 5),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(bottom: 50),
                crossAxisCount: 2,
                children: List.generate(
                    this.categories.length, (index) {
                  return CategoryCard(
                    category: categories[index],
                    onCardClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SelectedCategoryPage(
                                selectedCategory: this.categories[index],
                              ),
                        ),
                      );
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
}

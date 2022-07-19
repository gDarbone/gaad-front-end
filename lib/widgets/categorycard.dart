import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';

import 'categoryicon.dart';

class CategoryCard extends StatelessWidget {
  Category? category;

  Function? onCardClick;

  CategoryCard({this.category, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick!();
      },
      child: Container(

          margin: EdgeInsets.only(bottom: 40, top: 10, left: 25, right: 25),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),

          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      'assets/BlocoMenuWhite.png',
                      fit: BoxFit.cover,
                    )),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                    )),
              ),
              Positioned(
                bottom: 2,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      CategoryIcon(
                          color: this.category!.color!,
                          iconName: this.category!.icon!),
                      SizedBox(width: 20),
                      Text(this.category!.name!,
                          style: TextStyle(
                              color: Color.fromRGBO(35, 100, 128, 1),
                              fontSize: 15))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

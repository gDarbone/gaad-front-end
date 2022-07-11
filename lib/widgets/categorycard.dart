import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';

import 'categoryicon.dart';

class CategoryCard extends StatelessWidget {
  Category? category;

  Function? onCardClick;

  CategoryCard({ this.category, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick!();
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 120,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    'assets/BlocoMenu.png',
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ]))),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    CategoryIcon(
                        color: this.category!.color!,
                        iconName: this.category!.icon!),
                    SizedBox(width: 1),
                    Text(this.category!.name!,
                        style: TextStyle(color: Colors.white, fontSize: 15))
                  ],
                ),
              ),
            )
          ],
        )
    ),
    );
  }
}

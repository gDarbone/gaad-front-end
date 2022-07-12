import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/models/subcategory.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';
import 'package:provider/provider.dart';

import '../services/categoryselectionservice.dart';

class DetailsPage extends StatefulWidget{


  SubCategory? subCategory;

  DetailsPage({this.subCategory});

  @override
  DetailsPageState createState() => DetailsPageState();
}


class DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context){
    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    widget.subCategory = catSelection.selectedSubCategory;

    return Scaffold(
        appBar: MainAppBar(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Stack(
                  children: [
                    Container(
                      height: 300,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent
                            ]
                          )
                        ),
                      ),
                    )
                  ],
              )
            ],
          ),
        )
    );
  }
}
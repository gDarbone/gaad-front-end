import 'package:flutter/material.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/models/subcategory.dart';
import 'package:gaad_mobile/widgets/mainappbar.dart';

class DetailsPage extends StatelessWidget{


  SubCategory? subCategory;

  DetailsPage({this.subCategory});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text(this.subCategory!.name!)
      )
    );
  }
}
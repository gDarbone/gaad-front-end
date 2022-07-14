import 'package:flutter/cupertino.dart';
import 'package:gaad_mobile/models/category.dart';

class CategorySelectionService{

  Category? _selectedCategory;

  Category? get selectedCategory  => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
  }


}
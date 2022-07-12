import 'package:flutter/cupertino.dart';
import 'package:gaad_mobile/models/category.dart';
import 'package:gaad_mobile/models/subcategory.dart';

class CategorySelectionService{

  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  Category? get selectedCategory  => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
  }

  SubCategory? get selectedSubCategory  => _selectedSubCategory;
  set selectedSubCategory(SubCategory? value) {
    _selectedSubCategory = value;
  }

}
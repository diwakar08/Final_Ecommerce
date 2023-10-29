import 'dart:convert';

import 'package:e_commerce/apis/CategoryModel.dart';
import 'package:e_commerce/apis/SubCategory2Model.dart';
import 'package:e_commerce/apis/SubCategoryModel.dart';
import 'package:http/http.dart' as http;

Future<CategoryModel> getCategory(token) async {
  final response = await http.get(
      Uri.parse('https://api.pehchankidukan.com/seller/category'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

  var data = jsonDecode(response.body);
  return CategoryModel.fromJson(data);
}

Future<SubCategoryModel> getSubCategory(token, String category) async {
  final response = await http.get(
      Uri.parse(
          'https://api.pehchankidukan.com/seller/category?category=${category}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

  var data = jsonDecode(response.body);
  return SubCategoryModel.fromJson(data);
}

Future<SubCategory2Model> getSubCategory2(
    token, String category, String subCategory) async {
  final response = await http.get(
      Uri.parse(
          'https://api.pehchankidukan.com/seller/category?category=${category}&subCategory1=${subCategory}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

  var data = jsonDecode(response.body);
  return SubCategory2Model.fromJson(data);
}

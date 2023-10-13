import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_product.dart';

class SubCategory2 extends StatelessWidget {
  String cat;
  String subCat;

  SubCategory2({required this.cat, required this.subCat});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Category Codes List'),
        ),
        body: SubCategoryList2(cat: cat, subCat:subCat),
      ),
    );
  }
}


class SubCategoryList2 extends StatelessWidget {
  String cat;
  String subCat;
  SubCategoryList2({required this.cat, required  this.subCat});
  List<String> categoryCodes=[];

  Future<void> getCategories(String category) async {


    Navigator.push(
      context as BuildContext,
    MaterialPageRoute(
      builder: (context) => AddProduct(token:'', id:'',category: cat,subCategory1: subCat,subCategory2: category,),
    ),
    );
  }

  Future<void> getAllCategory() async {
    const apiUrl = "https://api.pehchankidukan.com/seller/category";
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      categoryCodes = jsonData['data'];
    } else {
      throw Exception('Failed to load categories');
    }
  }
  void initState() {
    getAllCategory();

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryCodes.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () async{
            await getCategories(categoryCodes[index]);
          },
          title: Text(categoryCodes[index]),
        );
      },
    );
  }
}
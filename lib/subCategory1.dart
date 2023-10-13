import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';

import 'SubCategory2.dart';
import 'package:http/http.dart' as http;

class SubCategory1 extends StatelessWidget {
  String cat;

  SubCategory1({ required this.cat, });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Category Codes List'),
        ),
        body: SubCategoryList1(cat: cat),
      ),
    );
  }
}

class SubCategoryList1 extends StatelessWidget {
  String cat;
  SubCategoryList1({ required this.cat,});

  List<String> categoryCodes=[];
  String subCat='';
  Future<void> getCategories(String category) async {


    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) => SubCategory2( cat: cat, subCat: subCat,),
      ),
    );
  }
  Future<void> getAllCategory() async {
    final apiUrl = "https://api.pehchankidukan.com/seller/category";
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
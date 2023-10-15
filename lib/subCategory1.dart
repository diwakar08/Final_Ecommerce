import 'dart:convert';
import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/subCategory2.dart'; // Make sure to import the correct SubCategory2 widget.
import 'package:http/http.dart' as http;

class SubCategory1 extends StatelessWidget {
  final String cat;

  SubCategory1({required this.cat});

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

class SubCategoryList1 extends StatefulWidget {
  final String cat;

  SubCategoryList1({required this.cat});

  @override
  State<SubCategoryList1> createState() => _SubCategoryList1State();
}

class _SubCategoryList1State extends State<SubCategoryList1> {
  List<String> categoryCodes = [];
  String subCat = '';
  String token = TokenId.token;
  String id = TokenId.id;

  Future<void> getCategories(String category) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubCategory2(cat: widget.cat, subCat: category),
      ),
    );
  }

  Future<void> getAllCategory() async {
    final apiUrl = "https://api.pehchankidukan.com/seller/category?category=${widget.cat}";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['data'];
      if (data.isNotEmpty) {
        List<dynamic> categoryList = data[0]['subCategory1'];
        if (categoryList.isNotEmpty) {
          setState(() {
            categoryCodes = List<String>.from(categoryList);
          });
        } else {
          // Handle the case where the "category" list is empty.
        }
      } else {
        // Handle the case where the "data" list is empty.
      }
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  void initState() {
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categoryCodes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () async {
              await getCategories(categoryCodes[index]);
            },
            title: Text(categoryCodes[index]),
          );
        },
      ),

    );
  }
}

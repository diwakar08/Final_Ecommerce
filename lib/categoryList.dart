import 'dart:convert';

import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/subCategory1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  final String productName;
  final String productDescription;
  Category({
    Key? key,
    required this.productName,
    required this.productDescription,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String token = TokenId.token;

  String id = TokenId.id;

  List<String> categoryCodes = [];

  Future<void> getCategories(String category) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubCategory1(
            cat: category,
            productDescription: widget.productDescription,
            productName: widget.productDescription,
          ),
        ));
  }

  Future<void> getAllCategory() async {
    final apiUrl = "https://api.pehchankidukan.com/seller/category";
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
        List<dynamic> categoryList = data[0]['category'];
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

  void initState() {
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Category Codes List'),
          ),
          body: ListView.builder(
            itemCount: categoryCodes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  getCategories(categoryCodes[index]);
                },
                leading: CircleAvatar(),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(categoryCodes[index]),
              );
            },
          )),
    );
  }
}

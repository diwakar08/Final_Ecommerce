import 'dart:convert';

import 'package:e_commerce/add_product.dart';
import 'package:e_commerce/main_dashboard.dart';
import 'package:e_commerce/seller_dashboard.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Regestration.dart';

class SubCategory2 extends StatefulWidget {
  final String cat, subCat, productName, productDescription;
  SubCategory2(
      {required this.cat,
      required this.subCat,
      required this.productName,
      required this.productDescription});

  @override
  State<SubCategory2> createState() => _SubCategory2State1();
}

class _SubCategory2State1 extends State<SubCategory2> {
  List<dynamic> categoryCodes = ['ABCDEFG', "XYZ"];
  String subCat = '';
  String token = TokenId.token;
  String id = TokenId.id;

  Future<void> getCategories(String category) async {
    print("ksfnieanfs");
    print(widget.productName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProduct(
          token: token,
          id: id,
          category: widget.cat,
          subCategory1: widget.subCat,
          subCategory2: category, 
          productDescription: widget.productDescription,
          productName: widget.productDescription,
        ),
      ),
    );
  }

  Future<void> getAllCategory(String cat, String subCat) async {
    print(cat);
    print(subCat);
    print("subCat");

    final apiUrl =
        "https://api.pehchankidukan.com/seller/category?category=${cat}subCategory1=${subCat}";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      List data = jsonData['data'];
      // print(data);
      categoryCodes = data;
      print(categoryCodes);
      setState(() {});
    }
  }

  @override
  void initState() {
    // getAllCategory(widget.cat, widget.subCat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // title: Text(widget.subCat),
      ),
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
      // body: ListView.builder(
      //   itemCount: categoryCodes.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       onTap: () async {
      //         await getCategories(categoryCodes[index]['subCategory2']);
      //       },
      //       title: Text(categoryCodes[index]['subCategory2']),
      //     );
      //   },
      // ),
    );
  }
}

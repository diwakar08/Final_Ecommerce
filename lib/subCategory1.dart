import 'dart:convert';
import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/subCategory2.dart'; // Make sure to import the correct SubCategory2 widget.
import 'package:http/http.dart' as http;

import 'add_product.dart';

class SubCategory1 extends StatefulWidget {
  final String cat;
  final String pid;
  final String productName;
  final String productDescription;
  final bool update;
  final String stockIO;
  final bool stockTF;
  final List dummyProductList;
  final List<ItemOption> itemOptions;

  SubCategory1(
      {Key? key,
        required this.cat,
        required this.productName, required this.productDescription,
        required this.update, required this.stockIO, required this.stockTF,
        required this.dummyProductList, required this.pid, required this.itemOptions
      });

  @override
  State<SubCategory1> createState() => _SubCategory1State();
}

class _SubCategory1State extends State<SubCategory1> {
  List<String> categoryCodes = [];
  String subCat = '';
  String token = TokenId.token;
  String id = TokenId.id;
  late final bool update;

  Future<void> getCategories(String category) async {
    print("inside getCAtegories subcat1");
    print(widget.productName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubCategory2(
          cat: widget.cat,
          subCat: category,
          productName: widget.productName,
          productDescription: widget.productDescription,
          pid: widget.pid,
          update: update,
          stockTF: widget.stockTF,
          stockIO: widget.stockIO,
          dummyProductList: widget.dummyProductList,
          itemOptions: widget.itemOptions,

        ),
      ),
    );
  }

  Future<void> getAllCategory() async {
    update=widget.update;
    String cat1 = widget.cat;
    cat1 = cat1.replaceAll("&", "%26");
    final apiUrl =
        "https://api.pehchankidukan.com/seller/category?category=${cat1}";
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
        final category = data[0]; // Access the first item in the data array
        List<dynamic> categoryList = category['subCategory1'];
        if (categoryList.isNotEmpty) {
          setState(() {
            categoryCodes = List<String>.from(categoryList);
          });
        }
      } else {
          // Handle the case where the "category" list is empty.
        }
      } else {
        // Handle the case where the "data" list is empty.
      throw Exception('Failed to load categories');
    }
  }

  @override
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
          title: Text(widget.cat),
        ),
        body: ListView.builder(
          itemCount: categoryCodes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () async {
                await getCategories(categoryCodes[index]);
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              title: Text(categoryCodes[index]),
            );
          },
        ),
      ),
    );
  }
}
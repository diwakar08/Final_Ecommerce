import 'dart:convert';

import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  // final String productName;
  // final String pid;
  // final String productDescription;
  // final bool update;
  // final String stockIO;
  // final bool stockTF;
  // final quantityPricing;
  // final List dummyProductList;
  // final List<ItemOption> itemOptions;
  Category({
    Key? key,
    // required this.productName,
    // required this.productDescription, required this.update, required this.stockIO, required this.stockTF,
    // this.quantityPricing, required this.dummyProductList, required this.pid, required this.itemOptions,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String token = TokenId.token;

  String id = TokenId.id;

  List<String> categoryCodes = [];

  Future<void> getCategories(String category) async {
    // print(widget.productName);
    print("widget.productNamecategoryme");
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SubCategory1(
    //         cat: category,
    // productDescription: widget.productDescription,
    // productName: widget.productName,
    // update:widget.update, stockIO: widget.stockIO, stockTF: widget.stockTF,
    //   dummyProductList:widget.dummyProductList,
    // itemOptions:widget.itemOptions,
    // pid: widget.pid,
    //   ),
    // ));
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
          categoryCodes = List<String>.from(categoryList);
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
    return Dialog(
      child: FutureBuilder(
        future: getAllCategory(),
        builder: (context, snapshot) {
          return ListView.builder(
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
          );
        },
      ),
    );
  }
}

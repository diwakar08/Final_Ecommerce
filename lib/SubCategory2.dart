import 'dart:convert';

import 'package:e_commerce/add_product.dart';
import 'package:e_commerce/main_dashboard.dart';
import 'package:e_commerce/seller_dashboard.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/update_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Regestration.dart';

class SubCategory2 extends StatefulWidget {
  final String cat, subCat, productName, productDescription;
  final String stockIO;
  final String pid;
  final bool stockTF;
  final List dummyProductList;
  final List<ItemOption> itemOptions;
  final bool update;
  SubCategory2(
      {Key? key,
        required this.cat,
        required this.subCat,
        required this.productName,
        required this.productDescription,
        required this.update,
        required this.stockTF,
        required this.stockIO,
        required this.dummyProductList, required this.pid, required this.itemOptions
      });

 @override
  State<SubCategory2> createState() => _SubCategory2State1();
}

class _SubCategory2State1 extends State<SubCategory2> {
  List<String> categoryCodes=[];
  String subCat = '';
  String token = TokenId.token;
  String id = TokenId.id;

  Future<void> getCategories(String category) async {
    print("ksfnieanfs");
    print(widget.productName);
    if(widget.update) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UpdateProducts(
            token: token,
            id: id,
            // category: widget.cat,
            // subCategory1: widget.subCat,
            // subCategory2: category,
            // productDescription: widget.productDescription,
            productName: widget.productName,
            pid: widget.pid,
            // productImage: '',
            productCategory: widget.cat,
            productSubCategory1: widget.subCat,
            productSubCategory2: category,
            stockTF: widget.stockTF,
            stockIO: widget.stockIO,
            // productType: '',
            description: widget.productDescription,
             quantityPricing:widget.dummyProductList
          ),
        ),
      );
    } else {
      print(widget.productName);
      print("widget.productNamesubcat2");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddProduct(
            token: token,
            id: id,
            productDescription: widget.productDescription,
            productName: widget.productName, productDetails: [],itemOptions: widget.itemOptions,
          ),
        ),
      );
    }
  }

  Future<void> getAllCategory(String cat, String subCat) async {
    print(cat);
    print(subCat);
    print("subCat");
    cat = cat.replaceAll("&", "%26");
    subCat = subCat.replaceAll("&", "%26");
    final apiUrl =//"https://api.pehchankidukan.com/seller/category?category=Beauty %26 Personal Care&subCategory1=Makeup";
        "https://api.pehchankidukan.com/seller/category?category=${cat}&subCategory1=${subCat}";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> jsonData = jsonDecode(response.body);
    //   List data = jsonData['data'];
    //   // print(data);
    //   categoryCodes = data;
    //   print(categoryCodes);
    //   setState(() {});
    // }
    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      List<dynamic> data = jsonData['data'];
      for (var item in data) {
        if (item is String) {
          categoryCodes.add(item);
        }
      }

      print(categoryCodes);
      setState(() {

      });
    } else {
      // Handle the case where the "data" list is empty.
      throw Exception('Failed to load categories');
    }
  }

  @override
  void initState() {
    getAllCategory(widget.cat, widget.subCat);
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
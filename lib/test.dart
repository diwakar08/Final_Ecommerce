import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/filterWidget.dart';
import 'package:e_commerce/services/Categories.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/update_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'add_product.dart';
import 'main.dart';
import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';

import './services/User_api.dart';
import './apis/orderModel.dart';
import './apis/ProductModel.dart';
import 'package:http/http.dart' as http;


class ManageProducts extends StatefulWidget {
  final String token, id;

  final  List<String> selectedcategories;
  final  Map<String, List<String>> selectedsubcategories;
  final  double  selectedminPrice,selectedmaxPrice;
  const ManageProducts({Key? key, required  this.token, required this.id,required this.selectedcategories,required this.selectedsubcategories,required this.selectedminPrice,required this.selectedmaxPrice}) : super(key: key);

  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  bool _switchValue = true;
  String stockIn = 'In Stock';
  String stockOut = 'Out of stock';
  String sortt = "";
  bool isSelected = false;
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0.0;
  late Order order;
  late List<Product> product;
  String response1 = "";


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void refreshContent() {
    // Store the current scroll position
    scrollPosition = _scrollController.offset;

    // Simulate a refresh (replace this with your actual refresh logic)
    Future.delayed(Duration(seconds: 2), () {
      // Restore the scroll position after the refresh
      if (_scrollController.hasClients) {
        setState(() {
          _scrollController.jumpTo(scrollPosition);
        });
      }
    });
  }
  @override
  initState() {
  }

  @override
  Widget build(BuildContext context) {
    String token = widget.token;
    String id = widget.id;
    Icon stockINorOut = Icon(Icons.circle_outlined,color: Colors.red.shade900,);

    return Scaffold(

        appBar: AppBar(
          title: Container(
            height: 50,
            margin: EdgeInsets.only(left: 5,right: 5),
            child:
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black,width: 1),
                boxShadow:[
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.5), //color of shadow
                    blurRadius: 7, // blur radius
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              margin: EdgeInsets.only( bottom: 5),
              child: TextField(
                style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'comfort'),
                decoration: InputDecoration(
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),


          backgroundColor: Colors.lightBlue.shade900,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        // body:
    );
  }
  //fetch product all
  Future<List<Product>> fetchOrders(sort, token, id) async {
    final List<Product> data ;
    if(sort=="") {
      data = await UserApi.getProducts(token, id);
    } else {
      data = await UserApi.getSellerProducts( sort, token, id);
    }
    return data;
  }

  Future<void> stockUpdate() async{
    final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products/$pid';

    // final itemOptions = quantityPricing;

    final Map<String, dynamic> productJson = {
      "inStock": _switchValue
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${TokenId.token}'
        },
        body: jsonEncode(productJson),
      );

      if (response.statusCode == 200) {
        print("product updated succesfully");

      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
    }
  }
  //update Stock only
  Future<void> updateStock(bool value, ppid) async {
    // print(value);
    // print("value");
    // print(ppid);
    final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products/$ppid';

    final Map<String, dynamic> productJson ;
    if (value==true)
      productJson = {"inStock":"true"}; else productJson = {"inStock":"false"};
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${TokenId.token}'
        },
        body: jsonEncode(productJson),
      );

      if (response.statusCode == 200) {
        print("product updated succesfully");

      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    // setState(() {
    //
    // });
  }

// void showSortOptions(BuildContext context) {
//   String selectedSortOption = 'Price (Low to High)';
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Sort Options'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             DropdownButton<String>(
//               value: selectedSortOption,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedSortOption = newValue!;  // Ensure newValue is not null
//                   // Apply sorting based on selectedSortOption
//                   // Implement your sorting logic here
//                 });
//               },
//               items: <String>[
//                 'Price (Low to High)',
//                 'Price (High to Low)',
//                 'Most Selling',
//                 'Rating',
//                 'Recently Added'
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('Apply'),
//             onPressed: () {
//               if(selectedSortOption=='Price (Low to High)'){
//                 print('Hello low');
//               }else if(selectedSortOption=='Rating'){
//                 print('Hello rating');
//               }
//               // Apply sorting based on selectedSortOption
//               // Implement your sorting logic here
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
}
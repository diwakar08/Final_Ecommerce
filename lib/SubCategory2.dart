// // import 'dart:convert';
// //
// // import 'package:e_commerce/services/tokenId.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// //
// // import 'add_product.dart';
// // //
// // // class SubCategory2 extends StatefulWidget {
// // //   String cat;
// // //   String subCat;
// // //
// // //   SubCategory2({required this.cat, required this.subCat});
// // //
// // //   @override
// // //   State<SubCategory2> createState() => _SubCategory2State();
// // // }
// // //
// // // class _SubCategory2State extends State<SubCategory2> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Category Codes List'),
// // //         ),
// // //         body: SubCategoryList2(cat: widget.cat, subCat:widget.subCat),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // class SubCategory2 extends StatefulWidget {
// //    String cat;
// //    String subCat;
// //   SubCategory2({required this.cat, required  this.subCat});
// //
// //   @override
// //   State<SubCategory2> createState() => _SubCategoryList2State();
// // }
// //
// // class _SubCategoryList2State extends State<SubCategory2> {
// //   List<dynamic> categoryCodes=[];
// //   String token = TokenId.token;
// //
// //   String id = TokenId.id;
// //   Future<void> getCategories(String category) async {
// //
// //
// //     Navigator.push(
// //       context as BuildContext,
// //       MaterialPageRoute(
// //         builder: (context) => AddProduct(token:'', id:'',category: widget.cat,subCategory1: widget.subCat,subCategory2: category,),
// //       ),
// //     );
// //   }
// //
// //
// //
// //   void initState() {
// //     getAllCategory(widget.cat, widget.subCat);
// //   }
// //
// //   // Future<void> getAllCategory(String cat, String subCat) async {
// //   //   final apiUrl =
// //   //       "https://api.pehchankidukan.com/seller/category?category=${cat}&subCategory=${subCat}";
// //   //   final response = await http.get(Uri.parse(apiUrl));
// //   //
// //   //   if (response.statusCode == 200) {
// //   //     final Map<String, dynamic> jsonData = jsonDecode(response.body);
// //   //     categoryCodes = jsonData['data'];
// //   //   } else {
// //   //     throw Exception('Failed to load categories');
// //   //   }
// //   // }
// //
// //   Future<void> getAllCategory(String cat, String subCat) async {
// //     print(cat);
// //     print(subCat);
// //     print("subCat");
// //
// //     final apiUrl = "https://api.pehchankidukan.com/seller/category?category=${cat}&subCategory1=${subCat}";
// //     final response = await http.get(Uri.parse(apiUrl),
// //       headers: <String, String>{
// //         'Content-Type': 'application/json',
// //         'Authorization': 'Bearer $token',
// //       },
// //     );
// //
// //     if (response.statusCode == 200) {
// //       final Map<String, dynamic> jsonData = jsonDecode(response.body);
// //       List<dynamic> data = jsonData['data'];
// //       categoryCodes=data;
// //       //   if (data.isNotEmpty) {
// //       //     List<dynamic> categoryList = data[0]['subCategory2'];
// //       //     if (categoryList.isNotEmpty) {
// //       //       setState(() {
// //       //         categoryCodes = List<String>.from(categoryList);
// //       //       });
// //       //     } else {
// //       //       // Handle the case where the "category" list is empty.
// //       //     }
// //       //   } else {
// //       //     // Handle the case where the "data" list is empty.
// //       //   }
// //       // } else {
// //       //   throw Exception('Failed to load categories');
// //       // }
// //     }
// //
// //
// //     @override
// //     Widget build(BuildContext context) {
// //       return Scaffold(
// //         body: ListView.builder(
// //           itemCount: categoryCodes.length,
// //           itemBuilder: (BuildContext context, int index) {
// //             return ListTile(
// //               onTap: () async {
// //                 await getCategories(categoryCodes[index]['subCategory2']);
// //               },
// //               title: Text(categoryCodes[index]['subCategory2']),
// //             );
// //           },
// //         ),
// //       );
// //     }
// //   }
// //
// //
// // }
//
//
//
//
// import 'dart:convert';
// import 'package:e_commerce/services/tokenId.dart';
// import 'package:flutter/material.dart';
// import 'package:e_commerce/subCategory2.dart'; // Make sure to import the correct SubCategory2 widget.
// import 'package:http/http.dart' as http;
//
// class SubCategory2 extends StatefulWidget {
//   final String cat, subCat;
//
//   SubCategory2({required this.cat, required this.subCat, });
//
//   @override
//   State<SubCategory2> createState() => _SubCategory2State();
// }
//
// class _SubCategory2State extends State<SubCategory2> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('subCategory2 Codes List'),
//         ),
//         body: SubCategoryList2(cat: widget.cat, subCat:widget.subCat),
//       ),
//     );
//   }
// }
//
// class SubCategoryList2 extends StatefulWidget {
//   final String cat, subCat;
//
//   SubCategoryList2({required this.cat, required this.subCat});
//
//   @override
//   State<SubCategoryList2> createState() => _SubCategoryList2State();
// }
//
//
// class _SubCategoryList2State extends State<SubCategoryList2> {
//   List<dynamic> categoryCodes = [];
//   String subCat = '';
//   String token = TokenId.token;
//   String id = TokenId.id;
//
//   Future<void> getCategories(String category) async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SubCategory2(cat: widget.cat, subCat: category),
//       ),
//     );
//   }
//
//   Future<void> getAllCategory(String cat, String subCat) async {
//     print(cat);
//     print(subCat);
//     print("subCat");
//
//     final apiUrl = "https://api.pehchankidukan.com/seller/category?category=${cat}&subCategory1=${subCat}";
//     final response = await http.get(Uri.parse(apiUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = jsonDecode(response.body);
//       List<dynamic> data = jsonData['data'];
//       categoryCodes = data;
//     }
//   }
//
//     @override
//     void initState() {
//       getAllCategory(widget.cat, widget.subCat);
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: ListView.builder(
//           itemCount: categoryCodes.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onTap: () async {
//                 await getCategories(categoryCodes[index]['subCategory2']);
//               },
//               title: Text(categoryCodes[index]['subCategory2']),
//             );
//           },
//         ),
//       );
//     }
// }



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
  final String cat, subCat;
  const SubCategory2({super.key, required this.cat, required this.subCat});


  @override
  _LoginScreenState1 createState() => _LoginScreenState1();
}



class _LoginScreenState1 extends State<SubCategory2> {


  List<dynamic> categoryCodes = [];
  String subCat = '';
  String token = TokenId.token;
  String id = TokenId.id;

  Future<void> getCategories(String category) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddProduct(token: token,
              id: id,
              category: widget.cat,
              subCategory1: widget.subCat,
              subCategory2: category,),
      ),
    );
  }

  Future<void> getAllCategory(String cat, String subCat) async {
    print(cat);
    print(subCat);
    print("subCat");

    final apiUrl = "https://api.pehchankidukan.com/seller/category?category=${cat}subCategory1=${subCat}";
    final response = await http.get(Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['data'];
      categoryCodes = data;
      print(categoryCodes);
      setState(() {

      });
    }
  }

  @override
  void initState() {
    getAllCategory(widget.cat, widget.subCat);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categoryCodes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () async {
                      await getCategories(categoryCodes[index]['subCategory2']);
                    },
            title: Text(categoryCodes[index]['subCategory2']),
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

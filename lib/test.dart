//
//
//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:e_commerce/services/tokenId.dart';
// import 'package:e_commerce/update_product.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:toggle_switch/toggle_switch.dart';
// import 'add_product.dart';
// import 'main.dart';
// import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';
//
// import './services/User_api.dart';
// import './apis/orderModel.dart';
// import './apis/ProductModel.dart';
// import 'package:http/http.dart' as http;
//
//
// class ManageProducts extends StatefulWidget {
//   final String token, id;
//   const ManageProducts({Key? key, required  this.token, required this.id}) : super(key: key);
//
//   @override
//   _ManageProductsState createState() => _ManageProductsState();
// }
//
// class _ManageProductsState extends State<ManageProducts> {
//   bool _switchValue = true;
//   String stockIn = 'In Stock';
//   String stockOut = 'Out of stock';
//
//   bool isSelected = false;
//
//   late Order order;
//   late List<Product> product;
//   String response1 = "";
//
//   Future<void> sortBy(fieldName) async {
//     product = await UserApi.getSellerProducts( fieldName, widget.token, widget.id);
//     setState(() {
//
//     });
//   }
//
//   @override
//   initState() {
//     fetchOrders(widget.token, widget.id);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String token = widget.token;
//     String id = widget.id;
//     Icon stockINorOut = Icon(Icons.circle_outlined,color: Colors.red.shade900,);
//
//     return Scaffold(
//
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   height: 50,
//                   margin: EdgeInsets.all(5),
//                   child:
//                   Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       border: Border.all(color: Colors.black,width: 1),
//                       boxShadow:[
//                         BoxShadow(
//                           color: Colors.black38.withOpacity(0.5), //color of shadow
//                           blurRadius: 7, // blur radius
//
//                         ),
//                         //you can set more BoxShadow() here
//                       ],
//
//
//                     ),
//                     margin: EdgeInsets.only( bottom: 5),
//
//                     child: TextField(
//                       style: TextStyle(fontSize: 15,color: Colors.black),
//                       decoration: InputDecoration(
//                         hintText: 'search',
//                         hintStyle: TextStyle(color: Colors.black),
//                         prefixIcon: Icon(Icons.search,color: Colors.black,),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   height: 50,
//                   margin: EdgeInsets.all(5),
//                   child:
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: FlutterPopupMenuButton(
//                       direction: MenuDirection.left,
//                       decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           color: Colors.white
//                       ),
//                       popupMenuSize: const Size(180,210),
//                       child: FlutterPopupMenuIcon(
//                         key: GlobalKey(),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(30)),
//                             border: Border.all(color: Colors.black,width: 1),
//                             boxShadow:[
//                               BoxShadow(
//                                 color: Colors.black38.withOpacity(0.5),
//                                 blurRadius: 7,
//                               ),
//                             ],
//                           ),
//                           margin: EdgeInsets.only( bottom: 5),
//
//                           child: Center(
//                             child: Row(
//                               children: [
//                                 SizedBox(width: 10,),
//                                 Icon(Icons.sort,color: Colors.black ),
//                                 Text('Filter',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontFamily: 'Poppins',
//
//                                     )),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       children: [
//                         FlutterPopupMenuItem(
//                             onTap: (){
//
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('Category'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.redAccent.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             )),
//                         FlutterPopupMenuItem(
//                             onTap: (){
//
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('Low to High'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.green.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             )),
//                         FlutterPopupMenuItem(
//                             onTap: (){
//
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('High to Low'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             )),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   height: 50,
//                   margin: EdgeInsets.all(5),
//                   child:
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: FlutterPopupMenuButton(
//                       direction: MenuDirection.left,
//                       decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           color: Colors.white
//                       ),
//                       popupMenuSize: const Size(180,270),
//                       child: FlutterPopupMenuIcon(
//                         key: GlobalKey(),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(30)),
//                             border: Border.all(color: Colors.black,width: 1),
//                             boxShadow:[
//                               BoxShadow(
//                                 color: Colors.black38.withOpacity(0.5),
//                                 blurRadius: 7,
//                               ),
//                             ],
//                           ),
//                           margin: EdgeInsets.only( bottom: 5),
//
//                           child: Center(
//                             child: Row(
//                               children: [
//                                 SizedBox(width: 10,),
//                                 Icon(Icons.sort,color: Colors.black ),
//                                 Text('Sort',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                       fontFamily: 'Poppins',
//
//                                     )),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       children: [
//                         FlutterPopupMenuItem(
//                             onTap: ()async{
//                               sortBy('productName');
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('By Product'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.redAccent.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             )),
//                         FlutterPopupMenuItem(
//                             onTap: (){
//                               sortBy("productName");
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('By Price'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.green.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             )),
//                         FlutterPopupMenuItem(
//                             onTap: (){
//                               sortBy("productSoldCount");
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('Most Selling'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blue.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             )),
//                         FlutterPopupMenuItem(
//                             onTap: (){
//
//                             },
//                             closeOnItemClick: true,
//                             child: ListTile(
//                               title: const Text('Rating Wise'),
//                               leading: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     color: Colors.cyanAccent.withOpacity(0.3),
//                                     shape: BoxShape.circle
//                                 ),
//                               ),
//                             ))
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           //  centerTitle: true,
//           backgroundColor: Colors.lightBlue.shade900,
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//
//         backgroundColor: Colors.white,
//
//         body:
//         FutureBuilder<List<Product>>(
//           future: fetchOrders(token, id),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               final List<Product>? data = snapshot.data;
//
//               return
//                 Container(
//
//                   child: ListView.builder(
//                     // scrollDirection: Axis.horizontal,
//                     itemCount: data?.length,
//                     itemBuilder: (context, index) {
//                       final prod = data?[index];
//                       String s = prod!.inStock.toString() == 'false' ? 'In stock' :'Out of stock';
//                       return Container(
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     margin: EdgeInsets.only(bottom: 5, top: 5, left: 11,right: 10),
//
//                                     child: SingleChildScrollView(
//                                       child: Row(
//                                         children: [
//                                           Expanded(
//                                             child:
//                                             Container(
//
//                                               height: 150,
//
//                                               margin: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
//                                               child: Column(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         CupertinoSwitch(
//                                                           activeColor: Colors.red,
//                                                           value: prod!.inStock,
//                                                           onChanged: (bool value) {
//
//                                                               s = value == false ? 'In stock' : 'Out of stock';
//                                                               _switchValue = value;
//                                                               updateStock(value, prod!.id);
//                                                           },
//                                                         ),
//                                                         Expanded(
//                                                             flex:2,
//                                                             child: Container(
//
//                                                               margin: EdgeInsets.only(left: 20),
//                                                               child: Text(s,
//                                                                   style: TextStyle(
//                                                                       color: Colors.green.shade900,
//                                                                       fontSize: 13,
//                                                                       fontFamily: 'Poppins',
//                                                                       fontWeight: FontWeight.bold
//                                                                   )),
//                                                             )),
//                                                         Icon(Icons.delete,color: Colors.red.shade900,size: 30,),
//                                                       ],
//                                                     ),
//                                                   ),
//
//                                                   SizedBox(height: 10,),
//                                                   Expanded(
//                                                     flex: 3,
//                                                     child: Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         (prod!.images.length>0)? Image.asset('assets/images/a1.jpg', height:150,width:80):
//                                                         Image.asset(
//                                                             'assets/images/a3.jpg',height:150,width:80),
//                                                         Column(
//                                                           children: [
//                                                             Expanded(
//
//                                                               child: Center(
//                                                                 child: Text(prod!.category,
//                                                                     style: TextStyle(
//                                                                       color: Colors.black,
//                                                                       fontSize: 15,
//                                                                       fontFamily: 'Poppins',
//
//                                                                     )),
//                                                               ),
//                                                             ),
//                                                             Expanded(
//
//                                                               child: Text(prod!.subCategory1,
//                                                                   style: TextStyle(
//                                                                     color: Colors.black,
//                                                                     fontSize: 13,
//                                                                     fontFamily: 'Poppins',
//                                                                   )),
//                                                             ),
//
//                                                           ],
//                                                         ),
//
//                                                         SizedBox(width: 50,),
//
//                                                         Column(
//                                                           children: [
//                                                             Expanded(
//
//                                                               child:  Text('MRP'
//                                                                   ' ${prod!.mrpPrice.toString()}',
//                                                                   style: TextStyle(
//                                                                       color: Colors.black,
//                                                                       fontSize: 16,
//                                                                       fontFamily: 'Poppins',
//                                                                       decoration: TextDecoration.lineThrough
//                                                                   )),
//                                                             ),
//                                                             Text('₹${prod!.offerPrice.toString()}',
//                                                                 style: TextStyle(
//                                                                     color: Colors.black,
//                                                                     fontSize: 20,
//                                                                     fontFamily: 'Poppins',
//                                                                     fontWeight: FontWeight.bold)),
//                                                           ],
//                                                         ),
//
//                                                       ],
//                                                     ),
//                                                   ),
//
//                                                   Expanded(
//
//                                                     child: Row(
//                                                       children: [
//                                                         Expanded(
//                                                             flex:2,
//                                                             child: Container(
//                                                               // margin: EdgeInsets.only(left: 20),
//                                                               child: Text(prod!.productName,
//                                                                   style: TextStyle(
//                                                                       color: Colors.black,
//                                                                       fontSize: 15,
//                                                                       fontFamily: 'Poppins',
//                                                                       fontWeight: FontWeight.bold
//                                                                   )),
//                                                             )),
//                                                         Expanded(
//
//                                                           child:  Container(
//
//                                                             child: MaterialButton(
//                                                               color: Colors.lightBlue.shade400,
//                                                               onPressed: (){
//                                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProducts(
//                                                                   pid:prod!.id,
//                                                                   token: token,
//                                                                   id: id,
//                                                                   productName: prod!
//                                                                       .productName,
//                                                                   // productImage: prod!
//                                                                   //     .image
//                                                                   //     .toString(),
//                                                                   productCategory:
//                                                                   prod!.category,
//                                                                   productSubCategory1:
//                                                                   prod!.subCategory1,
//                                                                   productSubCategory2:
//                                                                   prod!.subCategory2,
//
//                                                                   quantityPricing: prod!
//                                                                       .productDetails,
//                                                                   stockTF: prod!.inStock,
//                                                                   stockIO: s,
//                                                                   // productType: prod!
//                                                                   //     .productType,
//                                                                   description: prod!
//                                                                       .description,
//                                                                 )));
//                                                               }, child: Text('Edit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                             Container(height: .5,color: Colors.black,),
//                           ],
//                         ),
//
//                       );
//
//                     },
//                   ),
//                 );
//
//             }
//           },
//         )
//     );
//   }
//
//     } catch (e) {
//     }
//   //fetch product all
//   Future<List<Product>> fetchOrders(token, id) async {
//     final data = await UserApi.getProducts(token, id);
//     return data;
//   }
//
//   Future<void> stockUpdate() async{
//     final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products/$pid';
//
//     // final itemOptions = quantityPricing;
//
//     final Map<String, dynamic> productJson = {
//       "inStock": _switchValue
//     };
//     var uri = Uri.parse(apiUrl);
//     try {
//       final response = await http.put(
//         uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${TokenId.token}'
//         },
//         body: jsonEncode(productJson),
//       );
//
//       if (response.statusCode == 200) {
//         print("product updated succesfully");
//
//       } else {
//         print('Failed to update product. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//   }
//   //update Stock only
//   Future<void> updateStock(bool value, ppid) async {
//     // print(value);
//     // print("value");
//     // print(ppid);
//     final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products/$ppid';
//
//     final Map<String, dynamic> productJson ;
//     if (value==true)
//       productJson = {"inStock":"true"}; else productJson = {"inStock":"false"};
//     var uri = Uri.parse(apiUrl);
//     try {
//       final response = await http.put(
//         uri,
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${TokenId.token}'
//         },
//         body: jsonEncode(productJson),
//       );
//
//       if (response.statusCode == 200) {
//         print("product updated succesfully");
//
//       } else {
//         print('Failed to update product. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (e) {
//       print(e);
//     }
//   setState(() {
//
//   });
//   }
// }
//
//





import 'dart:io';

import 'package:e_commerce/review_listed.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'categoryList.dart';
import 'main.dart';
import 'package:image_picker/image_picker.dart';


// import 'package:e_commerce/home.dart';
import 'package:e_commerce/seller_dashboard.dart';
import 'package:e_commerce/seller_login.dart';
import 'package:flutter/material.dart';
// import 'dart:ui_web' show debugEmulateFlutterTesterEnvironment;

void main() {
  // debugEmulateFlutterTesterEnvironment = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    bool forAndroid=false;
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),

      ),
      body:Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                selectImages();
              },
              child: Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt),
                      Icon(Icons.add_circle_outline),
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 150,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageFileList!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5),
                    itemBuilder:
                        (BuildContext context, int index) {
                      return Image.file(
                        File(imageFileList![index].path),
                        fit: BoxFit.cover,
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

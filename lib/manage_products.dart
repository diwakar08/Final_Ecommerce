import 'dart:io';
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


class ManageProducts extends StatefulWidget {
  final String token, id;
  const ManageProducts({Key? key, required  this.token, required this.id}) : super(key: key);

  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  bool _switchValue = true;
  String stockIn = 'In Stock';
  String stockOut = 'Out of stock';

  bool isSelected = false;

  late Order order;
  late List<Product> product;
  String response1 = "";

  @override
  initState() {
    fetchOrders(widget.token, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    String token = widget.token;
    String id = widget.id;
    Icon stockINorOut = Icon(Icons.circle_outlined,color: Colors.red.shade900,);

    return Scaffold(

        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(5),
                  child:
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
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
                      style: TextStyle(fontSize: 15,color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.search,color: Colors.black,),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(5),
                  child:
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlutterPopupMenuButton(
                      direction: MenuDirection.left,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white
                      ),
                      popupMenuSize: const Size(180,210),
                      child: FlutterPopupMenuIcon(
                        key: GlobalKey(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.black,width: 1),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.5),
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only( bottom: 5),

                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.sort,color: Colors.black ),
                                Text('Filter',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',

                                    )),

                              ],
                            ),
                          ),
                        ),
                      ),
                      children: [
                        FlutterPopupMenuItem(
                          onTap: (){

                          },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('Category'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )),
                        FlutterPopupMenuItem(
                            onTap: (){

                            },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('Low to High'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )),
                        FlutterPopupMenuItem(
                            onTap: (){

                            },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('High to Low'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(5),
                  child:
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlutterPopupMenuButton(
                      direction: MenuDirection.left,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white
                      ),
                      popupMenuSize: const Size(180,270),
                      child: FlutterPopupMenuIcon(
                        key: GlobalKey(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.black,width: 1),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.5),
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only( bottom: 5),

                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Icon(Icons.sort,color: Colors.black ),
                                Text('Sort',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',

                                    )),

                              ],
                            ),
                          ),
                        ),
                      ),
                      children: [
                        FlutterPopupMenuItem(
                            onTap: (){

                            },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('By Product'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )),
                        FlutterPopupMenuItem(
                            onTap: (){

                            },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('By Price'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )),
                        FlutterPopupMenuItem(
                            onTap: (){

                            },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('Most Selling'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )),
                        FlutterPopupMenuItem(
                            onTap: (){

                            },
                            closeOnItemClick: true,
                            child: ListTile(
                              title: const Text('Rating Wise'),
                              leading: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.cyanAccent.withOpacity(0.3),
                                    shape: BoxShape.circle
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          //  centerTitle: true,
          backgroundColor: Colors.lightBlue.shade900,
          iconTheme: IconThemeData(color: Colors.white),
        ),

        backgroundColor: Colors.white,

        body:
        FutureBuilder<List<Product>>(
          future: fetchOrders(token, id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Product>? data = snapshot.data;

              return
                Container(

                  child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      final prod = data?[index];
                      String s = prod!.inStock.toString() == 'false' ? 'In stock' :'Out of stock';
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 5, top: 5, left: 11,right: 10),

                                    child: SingleChildScrollView(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child:
                                            Container(

                                              height: 150,

                                              margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
                                              child: Column(

                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        CupertinoSwitch(
                                                          activeColor: Colors.red,
                                                          value: false,//prod!.stock,

                                                          onChanged: (value) {
                                                            _switchValue = value;
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProducts(token: token, id: id, productName: prod!.productName,
                                                                productImage: prod!.image.toString(), productMRPPrice: prod!.mrpPrice.toString(),productOfferPrice: prod!.offerPrice.toString(),productQuantity:
                                                                prod!.quantityType,stockTF: false,productType: prod!.productType,description: prod!.description,
                                                                stockIO: prod.inStock?'inStock':'out Of Stock', productCategory: prod!.category, productSubCategory: prod!.subCategory1),),
                                                            );
                                                            setState(() {

                                                            });
                                                          },
                                                        ),
                                                        Expanded(
                                                            flex:2,
                                                            child: Container(

                                                              margin: EdgeInsets.only(left: 20),
                                                              child: Text(s,
                                                                  style: TextStyle(
                                                                      color: Colors.green.shade900,
                                                                      fontSize: 13,
                                                                      fontFamily: 'Poppins',
                                                                      fontWeight: FontWeight.bold
                                                                  )),
                                                            )),
                                                        Icon(Icons.delete,color: Colors.red.shade900,size: 30,),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: 10,),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Image.asset('assets/images/c7.png',height: 150,width: 80, ),
                                                        Column(
                                                          children: [
                                                            Expanded(

                                                              child: Center(
                                                                child: Text(prod!.category,
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 15,
                                                                      fontFamily: 'Poppins',

                                                                    )),
                                                              ),
                                                            ),
                                                            Expanded(

                                                              child: Text(prod!.subCategory1,
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 13,
                                                                    fontFamily: 'Poppins',
                                                                  )),
                                                            ),

                                                          ],
                                                        ),

                                                        SizedBox(width: 50,),

                                                        Column(
                                                          children: [
                                                            Expanded(

                                                              child:  Text('MRP'
                                                                  ' ${prod!.mrpPrice.toString()}',
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 16,
                                                                      fontFamily: 'Poppins',
                                                                      decoration: TextDecoration.lineThrough
                                                                  )),
                                                            ),
                                                            Text('₹${prod!.offerPrice.toString()}',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 20,
                                                                    fontFamily: 'Poppins',
                                                                    fontWeight: FontWeight.bold)),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),

                                                  Expanded(

                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex:2,
                                                            child: Container(
                                                              // margin: EdgeInsets.only(left: 20),
                                                              child: Text(prod!.productName,
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 15,
                                                                      fontFamily: 'Poppins',
                                                                      fontWeight: FontWeight.bold
                                                                  )),
                                                            )),
                                                        Expanded(

                                                          child:  Container(

                                                            child: MaterialButton(
                                                              color: Colors.lightBlue.shade400,
                                                              onPressed: (){
                                                                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProducts(token: token, id: id, productName: prod!.productName,
                                                                  productImage: prod!.image.toString(), productMRPPrice: prod!.mrpPrice.toString(),productOfferPrice: prod!.offerPrice.toString(),productQuantity:
                                                                  prod!.quantityType,stockTF: false,productType: prod!.productType,description: prod!.description,
                                                                  stockIO: prod.inStock?'inStock':'out Of Stock', productCategory: prod!.category, productSubCategory: prod!.subCategory1,)));
                                                              }, child: Text('Edit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Container(height: .5,color: Colors.black,),
                          ],
                        ),

                      );

                    },
                  ),
                );

            }
          },
        )
    );
  }
  Future<List<Product>> fetchOrders(token, id) async {
    final data = await UserApi.getProducts(token, id);

    return data;
  }
}
















































// import 'dart:io';
// import 'package:e_commerce/update_product.dart';
// import 'package:e_commerce/update_p.dart';
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
//
//
// class ManageProducts extends StatefulWidget {
//   const ManageProducts({Key? key}) : super(key: key);
//
//   @override
//   _ManageProductsState createState() => _ManageProductsState();
// }
//
// class _ManageProductsState extends State<ManageProducts> {
//   late bool _switchValue = true;
//
//   late Order order;
//   late List<Product> product;
//   String response1 = "";
//
//   @override
//   initState() {
//     fetchOrders();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     Icon stockINorOut = Icon(Icons.circle_outlined,color: Colors.red.shade900,);
//
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                 height: 50,
//                 margin: EdgeInsets.all(5),
//                 child:
//                 Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     border: Border.all(color: Colors.black,width: 1),
//                     boxShadow:[
//                       BoxShadow(
//                         color: Colors.black38.withOpacity(0.5), //color of shadow
//                         blurRadius: 7, // blur radius
//
//                       ),
//                       //you can set more BoxShadow() here
//                     ],
//
//
//                   ),
//                   margin: EdgeInsets.only( bottom: 5),
//
//                   child: TextField(
//                     style: TextStyle(fontSize: 15,color: Colors.black),
//                     decoration: InputDecoration(
//                       hintText: 'search',
//                       hintStyle: TextStyle(color: Colors.black),
//                       prefixIcon: Icon(Icons.search,color: Colors.black,),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 height: 50,
//                 margin: EdgeInsets.all(5),
//                 child:
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: FlutterPopupMenuButton(
//                     direction: MenuDirection.left,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         color: Colors.white
//                     ),
//                     popupMenuSize: const Size(180,210),
//                     child: FlutterPopupMenuIcon(
//                       key: GlobalKey(),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                           border: Border.all(color: Colors.black,width: 1),
//                           boxShadow:[
//                             BoxShadow(
//                               color: Colors.black38.withOpacity(0.5),
//                               blurRadius: 7,
//                             ),
//                           ],
//                         ),
//                         margin: EdgeInsets.only( bottom: 5),
//
//                         child: Center(
//                           child: Row(
//                             children: [
//                               SizedBox(width: 10,),
//                               Icon(Icons.sort,color: Colors.black ),
//                               Text('Filter',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontFamily: 'Poppins',
//
//                                   )),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     children: [
//                       FlutterPopupMenuItem(
//                           closeOnItemClick: true,
//                           child: ListTile(
//                             title: const Text('Category'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.redAccent.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           )),
//                       FlutterPopupMenuItem(
//                           closeOnItemClick: false,
//                           child: ListTile(
//                             title: const Text('Low to High'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.green.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           )),
//                       FlutterPopupMenuItem(
//                           closeOnItemClick: false,
//                           child: ListTile(
//                             title: const Text('High to Low'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           )),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 height: 50,
//                 margin: EdgeInsets.all(5),
//                 child:
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: FlutterPopupMenuButton(
//                     direction: MenuDirection.left,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         color: Colors.white
//                     ),
//                     popupMenuSize: const Size(180,270),
//                     child: FlutterPopupMenuIcon(
//                       key: GlobalKey(),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                           border: Border.all(color: Colors.black,width: 1),
//                           boxShadow:[
//                             BoxShadow(
//                               color: Colors.black38.withOpacity(0.5),
//                               blurRadius: 7,
//                             ),
//                           ],
//                         ),
//                         margin: EdgeInsets.only( bottom: 5),
//
//                         child: Center(
//                           child: Row(
//                             children: [
//                               SizedBox(width: 10,),
//                               Icon(Icons.sort,color: Colors.black ),
//                               Text('Sort',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontFamily: 'Poppins',
//
//                                   )),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     children: [
//                       FlutterPopupMenuItem(
//                           closeOnItemClick: true,
//                           child: ListTile(
//                             title: const Text('By Product'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.redAccent.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           )),
//                       FlutterPopupMenuItem(
//                           closeOnItemClick: false,
//                           child: ListTile(
//                             title: const Text('By Price'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.green.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           )),
//                       FlutterPopupMenuItem(
//                           child: ListTile(
//                             title: const Text('Most Selling'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           )),
//                       FlutterPopupMenuItem(
//                           child: ListTile(
//                             title: const Text('Rating Wise'),
//                             leading: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.cyanAccent.withOpacity(0.3),
//                                   shape: BoxShape.circle
//                               ),
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       //  centerTitle: true,
//         backgroundColor: Colors.lightBlue.shade900,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//
//       backgroundColor: Colors.white,
//
//       body:
//       FutureBuilder<List<Product>>(
//         future: fetchOrders(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final List<Product>? data = snapshot.data;
//
//             return
//                   Container(
//
//                     child: ListView.builder(
//                      // scrollDirection: Axis.horizontal,
//                       itemCount: data?.length,
//                       itemBuilder: (context, index) {
//                         final prod = data?[index];
//                         String s = prod!.stock.toString() == 'false' ? 'In stock' : 'Out of stock';
//                         _switchValue = prod!.stock;
//                         return Container(
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Container(
//                                         margin: EdgeInsets.only(bottom: 5, top: 5, left: 11,right: 10),
//
//                                         child: SingleChildScrollView(
//                                           child: Row(
//                                             children: [
//                                               Expanded(
//                                                 child:
//                                                 Container(
//
//                                                   height: 150,
//
//                                                   margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
//                                                   child: Column(
//
//                                                     children: [
//                                                       Expanded(
//                                                         child: Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//
//                                                             CupertinoSwitch(
//                                                               activeColor: Colors.red,
//                                                               value: _switchValue,
//                                                               onChanged: (bool value) {
//                                                                 setState(() {
//                                                                   _switchValue = value;
//                                                                 });
//                                                               },
//                                                             ),
//                                                             Expanded(
//                                                                 flex:2,
//                                                                 child: Container(
//                                                                   margin: EdgeInsets.only(left: 20),
//                                                                   child: Text(s,
//                                                                       style: TextStyle(
//                                                                           color: Colors.green.shade900,
//                                                                           fontSize: 13,
//                                                                           fontFamily: 'Poppins',
//                                                                           fontWeight: FontWeight.bold
//                                                                       )),
//                                                                 )),
//                                                             Icon(Icons.delete,color: Colors.red.shade900,size: 30,),
//                                                           ],
//                                                         ),
//                                                       ),
//
//                                                       SizedBox(height: 10,),
//                                                       Expanded(
//                                                         flex: 3,
//                                                         child: Row(
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Image.asset('assets/images/c7.png',height: 150,width: 80, ),
//                                                             Column(
//                                                               children: [
//                                                                 Expanded(
//
//                                                                   child: Center(
//                                                                     child: Text(prod!.category,
//                                                                         style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 15,
//                                                                           fontFamily: 'Poppins',
//
//                                                                         )),
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//
//                                                                   child: Text(prod!.subcategory,
//                                                                       style: TextStyle(
//                                                                         color: Colors.black,
//                                                                         fontSize: 13,
//                                                                         fontFamily: 'Poppins',
//                                                                       )),
//                                                                 ),
//
//                                                               ],
//                                                             ),
//
//                                                             SizedBox(width: 50,),
//
//                                                             Column(
//                                                               children: [
//                                                                 Expanded(
//
//                                                                   child:  Text('MRP'
//                                                                       ' ${prod!.mrpPrice.toString()}',
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 16,
//                                                                           fontFamily: 'Poppins',
//                                                                           decoration: TextDecoration.lineThrough
//                                                                       )),
//                                                                 ),
//                                                                 Text('₹${prod!.offerPrice.toString()}',
//                                                                     style: TextStyle(
//                                                                         color: Colors.black,
//                                                                         fontSize: 20,
//                                                                         fontFamily: 'Poppins',
//                                                                         fontWeight: FontWeight.bold)),
//                                                               ],
//                                                             ),
//
//                                                           ],
//                                                         ),
//                                                       ),
//
//                                                       Expanded(
//
//                                                         child: Row(
//                                                           children: [
//                                                             Expanded(
//                                                                 flex:2,
//                                                                 child: Container(
//                                                                   // margin: EdgeInsets.only(left: 20),
//                                                                   child: Text(prod!.productName,
//                                                                       style: TextStyle(
//                                                                           color: Colors.black,
//                                                                           fontSize: 15,
//                                                                           fontFamily: 'Poppins',
//                                                                           fontWeight: FontWeight.bold
//                                                                       )),
//                                                                 )),
//                                                             Expanded(
//
//                                                               child:  Container(
//
//                                                                 child: MaterialButton(
//                                                                   color: Colors.lightBlue.shade400,
//                                                                   onPressed: (){
//                                                                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(prod!.productName,prod!.image.toString(),prod!.category,prod!.subcategory,prod!.mrpPrice.toString(),prod!.offerPrice.toString(),prod!.quantityType,prod!.stock,s),));
//                                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProducts(productName: prod!.productName,productImage: prod!.image.toString(),productCategory: prod!.subcategory,productSubCategory: prod!.subcategory,productMRPPrice: prod!.mrpPrice.toString(),productOfferPrice: prod!.offerPrice.toString(),productQuantity: prod!.quantityType,stockTF: prod!.stock,stockIO: s,productType: prod!.productType,description: prod!.description,)));
//                                                                   }, child: Text('Edit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//                                 Container(height: .5,color: Colors.black,),
//                               ],
//                             ),
//
//                           );
//
//                       },
//                     ),
//                   );
//
//           }
//         },
//       )
//     );
//   }
//   Future<List<Product>> fetchOrders() async {
//     final data = await UserApi.getProducts();
//
//     return data;
//   }
// }

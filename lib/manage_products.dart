import 'dart:convert';
import 'package:e_commerce/filterWidget.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/update_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/custom_popup_menu_button.dart';
import 'package:number_paginator/number_paginator.dart';

import './services/User_api.dart';
import './apis/orderModel.dart';
import './apis/ProductModel.dart';
import 'package:http/http.dart' as http;

class ManageProducts extends StatefulWidget {
  final String token, id;

  final List<String> selectedcategories;
  final Map<String, List<String>> selectedsubcategories;
  final double selectedminPrice, selectedmaxPrice;
  final sortt;
  const ManageProducts(
      {Key? key,
      required this.token,
      required this.id,
      required this.selectedcategories,
      required this.selectedsubcategories,
      required this.selectedminPrice,
      required this.selectedmaxPrice,
      required this.sortt})
      : super(key: key);

  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  String stockIn = 'In Stock';
  String stockOut = 'Out of stock';
  String sortt = "";
  bool isSelected = false;
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0.0;
  late Order order;
  late List<Product> product;
  String response1 = "";
  Future<List<Product>>? _productData;
  int numberOfPages = 8;
  int currentPage = 1;

  Future<void> showDeleteConfirmationDialog(String id) async {
    print("idddd12");
    print(id);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Product?'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // removeImage(0);
                print("iddd");
                print(id);
                UserApi.deleteProduct(id);
                // Remove the image from the list

                _productData =
                    fetchOrders("", TokenId.token, TokenId.id, currentPage);

                setState(() {
                  Navigator.of(context).pop();
                });
                // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> updateOnSearch(query) async {
    if (query.length == 0) {
      setState(() {
        _productData =
            fetchOrders("created_at", TokenId.token, TokenId.id, currentPage);
      });
      return;
    } else if (query.length < 3) {
      return;
    } else {
      setState(() {
        _productData = UserApi.searchProducts(query, TokenId.token, TokenId.id);
      });
    }
  }

  Future<void> pagination(currentPage) async {
    setState(() {
      _productData =
          fetchOrders("created_at", TokenId.token, TokenId.id, currentPage);
    });
  }

  void removeImage(int index) {
    setState(() {
      product.removeAt(index);
    });
  }

  @override
  initState() {
    super.initState();

    sortt = widget.sortt;
    _productData = fetchOrders(sortt, TokenId.token, TokenId.id, currentPage);
    print("_productData");
    print(_productData);
  }

  @override
  Widget build(BuildContext context) {
    String token = widget.token;
    String id = widget.id;

    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 50,
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.5), //color of shadow
                    blurRadius: 7, // blur radius
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              margin: EdgeInsets.only(bottom: 5),
              child: TextField(
                style: TextStyle(
                    fontSize: 16, color: Colors.black, fontFamily: 'comfort'),
                decoration: InputDecoration(
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (query) async {
                  await updateOnSearch(query);
                },
              ),
            ),
          ),
          backgroundColor: Colors.lightBlue.shade900,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Product>>(
          future: _productData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Product>? data = snapshot.data;

              return Column(
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () async {
                              await UserApi.getAllCategory();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FilterScreen(),
                                  ));
                            },
                            child: Container(
                              height: 50,
                              margin:
                                  EdgeInsets.only(left: 5, right: 2, top: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38.withOpacity(0.5),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 5),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/filter.png',
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('Filter',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'comfort',
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.only(left: 2, right: 5, top: 5),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: FlutterPopupMenuButton(
                                direction: MenuDirection.left,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white),
                                popupMenuSize: const Size(220, 300),
                                child: FlutterPopupMenuIcon(
                                  key: GlobalKey(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.black38.withOpacity(0.5),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.sort, color: Colors.black),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text('Sort',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'comfort',
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                children: [
                                  FlutterPopupMenuItem(
                                      onTap: () async {
                                        setState(() {
                                          _productData = fetchOrders(
                                              "productDetails.mrpPrice",
                                              token,
                                              id,
                                              currentPage);
                                          sortt = "productDetails.mrpPrice";
                                        });
                                      },
                                      closeOnItemClick: true,
                                      child: ListTile(
                                        title: const Text(
                                          'Price(Low to High)',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        leading: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              shape: BoxShape.circle),
                                        ),
                                      )),
                                  FlutterPopupMenuItem(
                                      onTap: () {
                                        setState(() {
                                          _productData = fetchOrders(
                                              "-productDetails.mrpPrice",
                                              token,
                                              id,
                                              currentPage);
                                          sortt = "-productDetails.mrpPrice";
                                        });
                                      },
                                      closeOnItemClick: true,
                                      child: ListTile(
                                        title: const Text(
                                          'Price(High to Low)',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        leading: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              shape: BoxShape.circle),
                                        ),
                                      )),
                                  FlutterPopupMenuItem(
                                      onTap: () {
                                        setState(() {
                                          _productData = fetchOrders(
                                              "-productSoldCount",
                                              token,
                                              id,
                                              currentPage);
                                          sortt = "-productSoldCount";
                                        });
                                      },
                                      closeOnItemClick: true,
                                      child: ListTile(
                                        title: const Text(
                                          'Most Selling',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        leading: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              shape: BoxShape.circle),
                                        ),
                                      )),
                                  FlutterPopupMenuItem(
                                      onTap: () {
                                        setState(() {
                                          _productData = fetchOrders(
                                              "created_at",
                                              token,
                                              id,
                                              currentPage);
                                        });
                                      },
                                      closeOnItemClick: true,
                                      child: ListTile(
                                        title: const Text(
                                          'Rating',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        leading: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              shape: BoxShape.circle),
                                        ),
                                      )),
                                  FlutterPopupMenuItem(
                                      onTap: () {
                                        setState(() {
                                          _productData = fetchOrders(
                                              "created_at",
                                              token,
                                              id,
                                              currentPage);
                                        });
                                      },
                                      closeOnItemClick: true,
                                      child: ListTile(
                                        title: const Text(
                                          'Recently Added',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        leading: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              shape: BoxShape.circle),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      // scrollDirection: Axis.horizontal,
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        final prod = data?[index];
                        String s = prod!.inStock.toString() == 'true'
                            ? 'In stock'
                            : 'Out of stock';

                        String starRating = '';
                        double prating = prod.productName.length % 6;
                        if (prating == 0) {
                          starRating = '⭐';
                        } else {
                          int fullStars = prating.floor();
                          double remaining = (prating - fullStars) as double;

                          starRating = '⭐' * fullStars;
                        }

                        // if (remaining > 0.25) {
                        //   starRating += '¼';
                        // }
                        // if (remaining > 0.5) {
                        //   starRating += '½';
                        // }
                        // if (remaining > 0.75) {
                        //   starRating += '¾';
                        // }

                        return Container(
                          color: Colors.grey.shade300,
                          child: Column(
                            children: [
                              Card(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 6, bottom: 6),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // margin: EdgeInsets.only(bottom: 5, top: 5, left: 11,right: 10),

                                        child: SingleChildScrollView(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  height: 170,
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Transform.scale(
                                                              scale: 0.7,
                                                              child:
                                                                  CupertinoSwitch(
                                                                activeColor:
                                                                    Colors
                                                                        .green,
                                                                value: prod
                                                                    .inStock,
                                                                onChanged: (bool
                                                                    value) {
                                                                  s = value ==
                                                                          true
                                                                      ? 'In stock'
                                                                      : 'Out of stock';
                                                                  setState(() {
                                                                    prod.inStock =
                                                                        value;
                                                                    updateStock(
                                                                        value,
                                                                        prod.id);
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 2,
                                                                child:
                                                                    Container(
                                                                  child: Text(s,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .green
                                                                              .shade900,
                                                                          fontSize:
                                                                              11,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                )),
                                                            IconButton(
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color: Colors
                                                                    .red
                                                                    .shade900,
                                                                size: 25,
                                                              ),
                                                              onPressed: () {
                                                                showDeleteConfirmationDialog(
                                                                    prod.id);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                child:
                                                                    Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          15),
                                                              child: (prod.images
                                                                          .length >
                                                                      0)
                                                                  ? Image
                                                                      .network(
                                                                      prod.images[
                                                                          0],
                                                                      height:
                                                                          150,
                                                                      width: 80,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    )
                                                                  : Image.asset(
                                                                      'assets/images/a1.jpg',
                                                                      height:
                                                                          150,
                                                                      width:
                                                                          80),
                                                            )),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                        child:
                                                                            Container(
                                                                      // margin: EdgeInsets.only(left: 20),
                                                                      child: Text(
                                                                          prod
                                                                              .productName,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 19,
                                                                              fontFamily: 'comfart',
                                                                              fontWeight: FontWeight.bold)),
                                                                    )),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                              '₹${prod.offerPrice.toString()}',
                                                                              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'comfort', fontWeight: FontWeight.bold)),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                              'MRP '
                                                                              '₹${prod.mrpPrice.toString()}'
                                                                              '${860}',
                                                                              style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'comfort', decoration: TextDecoration.lineThrough)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            18,
                                                                        decoration: const BoxDecoration(
                                                                            //  border: Border.all(color: Colors.black),
                                                                            borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                        //   margin: EdgeInsets.only(right: 20),
                                                                        child: Text(
                                                                            starRating,
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 13.5,
                                                                                fontFamily: 'comfort',
                                                                                fontWeight: FontWeight.bold)),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            220,
                                                                        child:
                                                                            MaterialButton(
                                                                          color: Colors
                                                                              .lightBlue
                                                                              .shade400,
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (context) => UpdateProducts(
                                                                                          pid: prod.id,
                                                                                          token: token,
                                                                                          id: id,
                                                                                          productName: prod.productName,
                                                                                          // productImage: prod!
                                                                                          //     .image
                                                                                          //     .toString(),
                                                                                          productCategory: prod.category,
                                                                                          productSubCategory1: prod.subCategory1,
                                                                                          productSubCategory2: prod.subCategory2,

                                                                                          quantityPricing: prod.productDetails,
                                                                                          stockTF: prod.inStock,
                                                                                          stockIO: s,
                                                                                          // productType: prod!
                                                                                          //     .productType,
                                                                                          description: prod.description,
                                                                                        )));
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Edit',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 16),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  NumberPaginator(
                    numberPages: numberOfPages,
                    onPageChange: (index) async {
                      index = index + 1;
                      currentPage = index;
                      await pagination(currentPage);
                      print("Jfdsjadgbjfvbsdg");
                    },
                  ),
                ],
              );
            }
          },
        ));
  }

  //fetch product all
  Future<List<Product>> fetchOrders(sort, token, id, currentPage) async {
    final List<Product> data;
    if (sort == "") {
      data = await UserApi.getProducts(token, id, currentPage);
    } else {
      data = await UserApi.getSellerProducts(sort, token, id);
    }
    return data;
  }

  //update Stock only
  Future<void> updateStock(bool value, ppid) async {
    // print(value);
    // print("value");
    // print(ppid);
    final apiUrl =
        'https://api.pehchankidukan.com/seller/${TokenId.id}/products/$ppid';

    final Map<String, dynamic> productJson;
    if (value == true)
      productJson = {"inStock": "true"};
    else
      productJson = {"inStock": "false"};
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
  }
}

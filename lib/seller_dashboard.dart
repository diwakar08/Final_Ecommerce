import 'dart:io';

// import 'package:e_commerce/home.dart';
import 'package:e_commerce/manage_products.dart';
import 'package:e_commerce/order_details.dart';
import 'package:e_commerce/main_dashboard.dart';
import 'package:e_commerce/seller_profile_option.dart';
//import 'package:e_commerce/seller_profile_option.dart';
import 'package:e_commerce/update_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_product.dart';
import 'main.dart';

import './services/User_api.dart';
import './apis/ProductModel.dart';

class SellerDashboard extends StatefulWidget {
  final String token, id;
  const SellerDashboard({Key? key, required this.token, required this.id})
      : super(key: key);

  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  final List<Map<String, String>> orders = [
    {
      'name': 'Abhishek',
      'amount': '₹50',
      'id': '123',
      'order': 'Item 1',
      'time': '10:00 AM',
    },
    {
      'name': 'Sahil',
      'amount': '\$30',
      'id': '124',
      'order': 'Item 2',
      'time': '11:30 AM',
    },
    {
      'name': 'Rohan',
      'amount': '\$70',
      'id': '125',
      'order': 'Item 3',
      'time': '1:45 PM',
    },
    {
      'name': 'Rishi',
      'amount': '\$40',
      'id': '126',
      'order': 'Item 4',
      'time': '3:15 PM',
    },
  ];
  final List<String> product = ["sugar", "rice", "soap", "flour"];
  final List<String> amount = ["1 kg", "2 kg", "2 Dozen", "5 kg"];
  final List<String> price = ["₹50", "₹70", "₹200", "₹150"];
  @override
  Widget build(BuildContext context) {
    var token = widget.token;
    var id = widget.id;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 30,
            ),
            // Expanded(child: Icon(Icons.notifications, color: Colors.white)),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return profileOptions(); // Replace NewScreen with the screen you want to navigate to
            //         },
            //       ),
            //     );
            //     // Handle the click or tap action here
            //     // For example, you can navigate to a new screen or perform some action.
            //   },
            //   child:CircleAvatar(
            //     backgroundColor: Colors.red.shade100,
            //     backgroundImage: AssetImage('assets/images/avatar.png'),
            //     radius: 18,
            //   ),),
          ],
        ),
        centerTitle: true,
        //backgroundColor: Colors.grey.shade200,
        backgroundColor: Colors.lightBlue.shade100,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Hello, Seller',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontFamily: 'comfort',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Sales Report',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'comfort',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_outlined, color: Colors.black)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlue.shade100,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    'This Month',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: 'comfort',
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ), //Text
                                  CircleAvatar(
                                    backgroundColor: Colors.lightBlue.shade900,
                                    radius: 40,
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 36,
                                      child: Text(
                                        '₹5052',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ),
                                    ), //CircleAvatar
                                  ), //CircleAvatar
                                  const SizedBox(
                                    height: 10,
                                  ), //SizedBox
                                ],
                              ),
                            ), //Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlue.shade100,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    'This Week',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: 'comfort',
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ), //Text
                                  CircleAvatar(
                                    backgroundColor: Colors.lightBlue.shade900,
                                    radius: 40,
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 36,
                                      child: Text(
                                        '₹852',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ),
                                    ), //CircleAvatar
                                  ), //CircleAvatar
                                  const SizedBox(
                                    height: 10,
                                  ), //SizedBox
                                ],
                              ),
                            ), //Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: orders.length > 0 && false,
                child: Container(
                  margin:
                      EdgeInsets.only(right: 10, left: 10, top: 30, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Recent Orders',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'comfort',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_outlined, color: Colors.black)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: orders.length > 0 && false,
                child: Container(
                  margin: EdgeInsets.only(left: 15.0, right: 15.0),
                  height: 420,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        final order = orders[index];
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 10.0),
                            child: Card(
                              elevation:
                                  5, // Add elevation to make it appear as a card
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: double.infinity,
                                        color: const Color(0xFFDADADA),
                                        child: const Center(
                                          child: Text(
                                            'Preparing',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text('Order ID: ${order['id']}'),
                                          const Spacer(),
                                          Text(
                                            order['time']!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                          PopupMenuButton<String>(
                                            // onSelected: _selectOption,
                                            itemBuilder:
                                                (BuildContext context) {
                                              return {'See order Details'}
                                                  .map((String choice) {
                                                return PopupMenuItem<String>(
                                                  value: choice,
                                                  child: Text(choice),
                                                );
                                              }).toList();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${order['name']}\'s Order',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            'Takeaway',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Visibility(
                                          child: Row(
                                        children: [
                                          Text(
                                            '${amount[index]} ${product[index]}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            price[index],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                      const SizedBox(height: 10),
                                      //
                                      // const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            color: Colors.blue[900],
                                            width: 170,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blue[900],
                                                  // elevation: 3, // Remove button elevation if not needed
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  'Make Order Ready',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ))),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Total Bill: ${price[index]} ',
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: orders.length > 0 && false,
                child: Center(
                  child: ViewMoreButton(
                    onPressed: () {
                      // Navigate to the desired route when the button is pressed
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => AllStoresScreen()));
                    },
                  ),
                ),
              ),

              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 10, top: 25, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Recent Added Product',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'comfort',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_outlined, color: Colors.black)
                  ],
                ),
              ),
              Card(
                elevation: 5,
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 6),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 130,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Image.asset(
                                                  'assets/images/a1.jpg',
                                                  height: 150,
                                                  width: 80),
                                            )),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child: Container(
                                                      // margin: EdgeInsets.only(left: 20),
                                                      child: Text('Product',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 19,
                                                              fontFamily:
                                                                  'comfart',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    )),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Text('₹500',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'comfort',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                              'MRP '
                                                              '₹456'
                                                              '${860}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'comfort',
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough)),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                                //  border: Border.all(color: Colors.black),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        //   margin: EdgeInsets.only(right: 20),
                                                        child: Text('⭐⭐⭐⭐',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 13.5,
                                                                fontFamily:
                                                                    'comfort',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 220,
                                                        child: MaterialButton(
                                                          color: Colors
                                                              .lightBlue
                                                              .shade400,
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Edit',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
              Card(
                elevation: 5,
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 6),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 130,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Image.asset(
                                                  'assets/images/g2.jpg',
                                                  height: 150,
                                                  width: 80),
                                            )),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child: Container(
                                                      // margin: EdgeInsets.only(left: 20),
                                                      child: Text('Product',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 19,
                                                              fontFamily:
                                                                  'comfart',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    )),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Text('₹500',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'comfort',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                              'MRP '
                                                              '₹456'
                                                              '${860}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'comfort',
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough)),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                                //  border: Border.all(color: Colors.black),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        //   margin: EdgeInsets.only(right: 20),
                                                        child: Text('⭐⭐⭐⭐',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 13.5,
                                                                fontFamily:
                                                                    'comfort',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 220,
                                                        child: MaterialButton(
                                                          color: Colors
                                                              .lightBlue
                                                              .shade400,
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Edit',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
              Center(
                child: ViewMoreButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainDashboard(
                            token: widget.token,
                            id: widget.id,
                            pageIndex: 0,
                            sortt: "created_at"),
                      ),
                      (route) => false, // This line clears the navigator stack
                    );
                    // Navigate to the desired route when the button is pressed
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AllStoresScreen()));
                  },
                ),
              ),

              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 15),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       child: Text(
                //         'Manage Your Product',
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontFamily: 'comfort',
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     Icon(Icons.arrow_drop_down_outlined, color: Colors.black)
                //   ],
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 10, right: 10,bottom: 15),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => AddProduct(
              //                     token: token,
              //                     id: id,
              //                     category: '',
              //                     subCategory1: '',
              //                     subCategory2: '',
              //                     productName: '',
              //                     productDescription: '', productDetails: [], itemOptions: [],
              //                   ),
              //                 ));
              //           },
              //           child: Card(
              //             shadowColor: Colors.black,
              //             color: Colors.blue.shade100,
              //             child: SizedBox(
              //               child: Padding(
              //                 padding: const EdgeInsets.all(20.0),
              //                 child: SingleChildScrollView(
              //                   child: Column(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: Colors.blue.shade900,
              //                         radius: 28,
              //                         child: const CircleAvatar(
              //                             backgroundColor: Colors.white,
              //                             radius: 24,
              //                             child: Icon(Icons.add_circle_outline,
              //                                 color:
              //                                 Colors.black)), //CircleAvatar
              //                       ), //CircleAvatar
              //                       const SizedBox(
              //                         height: 10,
              //                       ), //SizedBox
              //                       SingleChildScrollView(
              //                         scrollDirection: Axis.horizontal,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               'Add Product',
              //                               style: TextStyle(
              //                                 fontSize: 18,
              //                                 color: Colors.black,
              //                                 fontWeight: FontWeight.w500,
              //                               ), //Textstyle
              //                             ),
              //                             Icon(Icons.arrow_drop_down_outlined,
              //                                 color: Colors.black)
              //                           ],
              //                         ),
              //                       ), //Text
              //                     ],
              //                   ),
              //                 ), //Column
              //               ), //Padding
              //             ), //SizedBox
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) =>
              //                       ManageProducts(token: token, id: id, selectedcategories: [], selectedsubcategories: {}, selectedminPrice: 0, selectedmaxPrice: 0,),
              //                 ));
              //           },
              //           child: Card(
              //             shadowColor: Colors.black,
              //             color: Colors.blue.shade100,
              //             child: SizedBox(
              //               child: Padding(
              //                 padding: const EdgeInsets.all(20.0),
              //                 child: SingleChildScrollView(
              //                   child: Column(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: Colors.blue.shade900,
              //                         radius: 28,
              //                         child: const CircleAvatar(
              //                             backgroundColor: Colors.white,
              //                             radius: 24,
              //                             child: Icon(Icons.edit,
              //                                 color:
              //                                 Colors.black)), //CircleAvatar
              //                       ), //CircleAvatar
              //                       const SizedBox(
              //                         height: 10,
              //                       ), //SizedBox
              //                       SingleChildScrollView(
              //                         scrollDirection: Axis.horizontal,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               'Manage Product',
              //                               style: TextStyle(
              //                                 fontSize: 18,
              //                                 color: Colors.black,
              //                                 fontWeight: FontWeight.w500,
              //                               ), //Textstyle
              //                             ),
              //                             Icon(Icons.arrow_drop_down_outlined,
              //                                 color: Colors.black)
              //                           ],
              //                         ),
              //                       ), //Text
              //                     ],
              //                   ),
              //                 ), //Column
              //               ), //Padding
              //             ), //SizedBox
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Product>> fetchOrders(token, id) async {
    final data = await UserApi.getProducts(token, id, 1);
    print("printing Dataaaa");
    print(data);
    setState(() {});
    return data;
  }
}

class ViewMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  ViewMoreButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.4; // Adjust the width as needed

    return InkWell(
      onTap: onPressed, // Call the provided onPressed function when tapped
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        alignment: Alignment.center,
        width: buttonWidth,
        height: 40,
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(255, 247, 247, 1.0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: Color(0xFF6AB04C)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            'View All',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'comfort',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

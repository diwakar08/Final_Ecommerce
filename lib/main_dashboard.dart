import 'package:e_commerce/seller_dashboard.dart';
import 'package:e_commerce/update_products.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './services/User_api.dart';
import './apis/ProductModel.dart';
import 'add_product.dart';
import 'manage_products.dart';
import 'order_details.dart';
import 'orders.dart';


class MainDashboard extends StatefulWidget {
  final String token, id;
  const MainDashboard({Key? key, required  this.token, required this.id}) : super(key: key);


  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int pageIndex = 0;

  final pages = [
    const SellerDashboard(),
    const ManageProducts(),
    const Orders(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcf5f4),

      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),

    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProducts(),));
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.edit,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.edit,
              color: Colors.white,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.pending_actions_rounded,
              color: Colors.white,
              size: 30,
            )
                : const Icon(
              Icons.pending_actions_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

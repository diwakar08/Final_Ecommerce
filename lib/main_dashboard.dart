import 'package:e_commerce/seller_dashboard.dart';
import 'package:e_commerce/seller_profile_option.dart';
import 'package:e_commerce/update_product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './services/User_api.dart';
import './apis/ProductModel.dart';
import 'add_product.dart';
import 'manage_products.dart';
import 'order_details.dart';
import 'orders.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';


class MainDashboard extends StatefulWidget {
  final String token, id;
  final int pageIndex;
  final String sortt;
  const MainDashboard({Key? key, required  this.token, required this.id, required this.pageIndex, required this.sortt}) : super(key: key);


  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> with TickerProviderStateMixin{

  MotionTabBarController? _motionTabBarController;
 List<String> screen =["Manage","Add","Home", "Orders", "Profile"];
  @override
  void initState() {
    super.initState();
    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: widget.pageIndex,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String token = widget.token;
    String id = widget.id;

    final pages = [
      SellerDashboard(token: token,id: id,),
      ManageProducts(token: token, id:id, selectedcategories: [], selectedsubcategories: {}, selectedminPrice: 0, selectedmaxPrice: 0, sortt: widget.sortt,),
      Orders(),
    ];
    return Scaffold(
      backgroundColor: const Color(0xfffcf5f4),

      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _motionTabBarController,
        children: <Widget>[
          ManageProducts(token: token, id:id, selectedcategories: [], selectedsubcategories: {}, selectedminPrice: 0, selectedmaxPrice: 0, sortt: widget.sortt,),
          AddProduct(
            token: token,
            id: id,
            productName: '',
            productDescription: '', productDetails: [], itemOptions: [],
          ),
          SellerDashboard(token: '', id: ''),
          Orders(),
          profileOptions(),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: screen[widget.pageIndex],
        useSafeArea: true, // default: true, apply safe area wrapper
        labels:  screen,
        icons: const [Icons.edit,Icons.add_circle_outline,Icons.home ,Icons.line_style_sharp, Icons.account_circle_outlined],

        // optional badges, length must be same with labels
        badges: [
          // Default Motion Badge Widget
          const MotionBadgeWidget(
          ),

          Container(

          ),

          // allow null
          null,

          // Default Motion Badge Widget with indicator only
          const MotionBadgeWidget(

          ),
          const MotionBadgeWidget(

          ),
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),

        tabIconColor: Colors.blue[900],
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),

    );
  }




}
import 'dart:io';

// import 'package:e_commerce/home.dart';
import 'package:e_commerce/manage_products.dart';
import 'package:e_commerce/order_details.dart';
import 'package:e_commerce/main_dashboard.dart';
import 'package:e_commerce/update_product.dart';
import 'package:flutter/material.dart';
import 'add_product.dart';
import 'main.dart';

import './services/User_api.dart';
import './apis/ProductModel.dart';


class SellerDashboard extends StatefulWidget {
  final String token, id;
  const SellerDashboard({Key? key, required  this.token, required this.id}) : super(key: key);

  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {

  @override
  Widget build(BuildContext context) {
    var token = widget.token;
    var id = widget.id;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  SellerDashboard2(),));
                },
                child: Text(
                  "PKD ",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 25,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),

            Expanded(child: Icon(Icons.notifications,color: Colors.white)),
            CircleAvatar(backgroundColor: Colors.red.shade100,backgroundImage: AssetImage('assets/images/avatar.png'),radius: 18,),
          ],
        ),
        centerTitle: true,
        //backgroundColor: Colors.grey.shade200,
         backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 10 ,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Welcome, Seller',
                        style: TextStyle(
                            fontSize: 25,

                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 10 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Analytics',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                             ),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_outlined,color: Colors.black)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        color: Colors.lightBlue.shade100,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.lightBlue.shade900,
                                    radius: 38,
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                       radius: 34,
                                      child: Text(
                                        '₹252',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ),
                                    ), //CircleAvatar
                                  ), //CircleAvatar
                                  const SizedBox(
                                    height: 10,
                                  ), //SizedBox
                                  Text(
                                    'Revenue',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ), //Text

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
                        color: Colors.lightBlue.shade900,
                        child: SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 38,
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 34,
                                      child: Text(
                                        '52+',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ),
                                    ), //CircleAvatar
                                  ), //CircleAvatar
                                  const SizedBox(
                                    height: 10,
                                  ), //SizedBox
                                  Text(
                                    'Order',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ), //Text
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
                      child: InkWell(

                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.black,
                          color: Colors.lightBlue.shade100,
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.lightBlue.shade900,
                                      radius: 38,
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 34,
                                        child: Text(
                                          '⭐52',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ),
                                      ), //CircleAvatar
                                    ), //CircleAvatar
                                    const SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                    Text(
                                      'Points',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ), //Textstyle
                                    ), //Text
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
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 20,bottom: 5),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Manage Your Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_outlined,color: Colors.black)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(token:token, id:id,),));
                        },
                        child: Card(

                          shadowColor: Colors.black,
                          color: Colors.grey.shade300,
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black54,
                                      radius: 28,
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 24,
                                        child:  Icon(Icons.add_circle_outline,color: Colors.black)
                                      ), //CircleAvatar
                                    ), //CircleAvatar
                                    const SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(

                                        children: [
                                         Text(
                                              'Add Product',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                            Icon(Icons.arrow_drop_down_outlined,color: Colors.black)
                                        ],
                                      ),
                                    ), //Text


                                  ],
                                ),
                              ), //Column
                            ), //Padding
                          ), //SizedBox
                        ),
                      ),
                    ),

                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProducts(token: token, id: id),));
                        },
                        child: Card(

                          shadowColor: Colors.black,
                          color: Colors.grey.shade300,
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black54,
                                      radius: 28,
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 24,
                                        child:  Icon(Icons.edit,color: Colors.black)
                                      ), //CircleAvatar
                                    ), //CircleAvatar
                                    const SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(

                                        children: [
                                          Text(
                                            'Manage Product',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ), //Textstyle
                                          ),
                                          Icon(Icons.arrow_drop_down_outlined,color: Colors.black)
                                        ],
                                      ),
                                    ), //Text



                                  ],
                                ),
                              ), //Column
                            ), //Padding
                          ), //SizedBox
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              //imp
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Most Selling',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w700

                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '>',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                child: FutureBuilder<List<Product>>(
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
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length,
                            itemBuilder: (context, index) {
                              final prod = data?[index];
                              String s = 'Out of stock';//prod!.stock.toString() == 'false' ? 'In stock' :
                              return  Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black45,width: 0.5),

                                ),
                                height: 140,
                                width: 130,
                                margin: EdgeInsets.only(bottom: 10, top: 10, left: 15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [

                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                                'assets/images/g3.png'),
                                          )
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Text(prod!.productName,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                              ))),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('₹{prod!.offerPrice.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey.shade900,
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.bold)),

                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: OutlinedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProducts(productName: prod!.productName,productImage: prod!.image.toString(),productCategory: 'prod!.subcategory',productSubCategory: 'prod!.subcategory',productMRPPrice: prod!.mrpPrice.toString(),productOfferPrice: 'prod!.offerPrice.toString()',productQuantity: prod!.quantityType,stockTF: false,stockIO: s,productType: prod!.productType,description: prod!.description,)));
                                          },child: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.green.shade900,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                              ))
                                          ))

                                    ],
                                  ),
                                ),
                              );

                            },
                          ),
                        );

                    }
                  },
                )
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Recent Listed',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w700

                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '>',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                child: FutureBuilder<List<Product>>(
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
                             scrollDirection: Axis.horizontal,
                            itemCount: data?.length,
                            itemBuilder: (context, index) {
                              final prod = data?[index];
                              String s = 'Out of stock';//prod!.stock.toString() == 'false' ? 'In stock' :
                              return  Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black45,width: 0.5),
                                ),
                                height: 140,
                                width: 130,
                                margin: EdgeInsets.only(bottom: 10, top: 10, left: 15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [

                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                                'assets/images/g1.png'),
                                          )
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Text(prod!.productName,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                              ))),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('₹{prod!.offerPrice.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey.shade900,
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.bold)),

                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: OutlinedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProducts(productName: prod!.productName,productImage: prod!.image.toString(),productCategory: 'prod!.subcategory',productSubCategory: 'prod!.subcategory',productMRPPrice: prod!.mrpPrice.toString(),productOfferPrice: prod!.
                                            offerPrice.toString(),productQuantity: prod!.quantityType,stockTF: true,stockIO: s,productType: prod!.productType,description: prod!.description,)));
                                          },child: Text('Edit',
                                              style: TextStyle(
                                                color: Colors.green.shade900,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                              ))
                                          ))

                                    ],
                                  ),
                                ),
                              );

                            },
                          ),
                        );

                    }
                  },
                )
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );


  }

  Future<List<Product>> fetchOrders(token, id) async {
    final data = await UserApi.getProducts(token, id);
    print("printing Dataaaa");
    print(data);
    return data;
  }

}

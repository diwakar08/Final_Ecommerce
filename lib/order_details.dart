import 'dart:io';
import 'package:e_commerce/review_listed.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class ProductDetails extends StatefulWidget {
  final String token, id;
  const ProductDetails({Key? key, required this.token, required this.id}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
  String token = widget.id;
  String id = widget.id;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Order Details",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade900,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      backgroundColor: Colors.grey.shade200,

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 35,
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(6))
                ),
                child: Center(child: Text('Status - Pending',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
              ),

              Container(
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'OrderID - #2568',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Poppins',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(

                          // textDirection: TextDirection.rtl,
                          // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                          // border:TableBorder.all(width: 2.0,color: Colors.red),
                          children: [
                            TableRow(
                                children: [
                                  Text("Customer Name:",textScaleFactor: 1.1,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Saksham",textScaleFactor: 1.1 ),

                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("Mobile No.:",textScaleFactor: 1.1,style: TextStyle(fontWeight: FontWeight.bold), ),
                                  Text("1234569872",textScaleFactor: 1.1),

                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("Delivery Time:",textScaleFactor: 1.1,style: TextStyle(fontWeight: FontWeight.bold), ),
                                  Text("1-2 day",textScaleFactor: 1.1),

                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("Order Place Time:",textScaleFactor: 1.1,style: TextStyle(fontWeight: FontWeight.bold), ),
                                  Text("11/09/2023",textScaleFactor: 1.1),

                                ]
                            ),


                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(

                          // textDirection: TextDirection.rtl,
                          // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                          // border:TableBorder.all(width: 2.0,color: Colors.red),
                          children: [
                            TableRow(
                                children: [
                                  Text("S.No.",textScaleFactor: 1.3,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Product",textScaleFactor: 1.3,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Quan.",textScaleFactor: 1.3,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Price",textScaleFactor: 1.3,style: TextStyle(fontWeight: FontWeight.bold),),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("1.",textScaleFactor: 1.3),
                                  Text("Sugar",textScaleFactor: 1.3),
                                  Text("1 kg",textScaleFactor: 1.3),
                                  Text("₹39",textScaleFactor: 1.3),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("2.",textScaleFactor: 1.3),
                                  Text("Maggi",textScaleFactor: 1.3),
                                  Text("3 pic.",textScaleFactor: 1.3),
                                  Text("₹40",textScaleFactor: 1.3),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("3.",textScaleFactor: 1.3),
                                  Text("Ghee",textScaleFactor: 1.3),
                                  Text("1 kg",textScaleFactor: 1.3),
                                  Text("₹625",textScaleFactor: 1.3),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("4.",textScaleFactor: 1.3),
                                  Text("Sugar",textScaleFactor: 1.3),
                                  Text("1 kg",textScaleFactor: 1.3),
                                  Text("₹39",textScaleFactor: 1.3),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("5.",textScaleFactor: 1.3),
                                  Text("Maggi",textScaleFactor: 1.3),
                                  Text("3 pic.",textScaleFactor: 1.3),
                                  Text("₹40",textScaleFactor: 1.3),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Text("6.",textScaleFactor: 1.3),
                                  Text("Ghee",textScaleFactor: 1.3),
                                  Text("1 kg",textScaleFactor: 1.3),
                                  Text("₹625",textScaleFactor: 1.3),
                                ]
                            ),


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),



              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
                child: MaterialButton(onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(token:token, id:id),));
                }, child: Text('Order Packed',style: TextStyle(color: Colors.white,fontSize: 15),)
                  ,color: Colors.lightBlue.shade500,
                  height: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );


  }


}
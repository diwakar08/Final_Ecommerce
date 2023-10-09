import 'dart:io';
import 'package:e_commerce/sucessfully_add.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class ReviewListed extends StatefulWidget {
  final String token, id;
  const ReviewListed({Key? key, required  this.token, required this.id}) : super(key: key);

  @override
  _ReviewListedState createState() => _ReviewListedState();
}

class _ReviewListedState extends State<ReviewListed> {

  @override
  Widget build(BuildContext context) {
  String token = widget.token;
  String id = widget.token;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Review",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

            Expanded(child: Icon(Icons.notifications,color: Colors.white,)),
            CircleAvatar(backgroundColor: Colors.red.shade100,backgroundImage: AssetImage('assets/images/avatar.png'),radius: 18,),
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
                height: 45,

                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade900,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                          color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    Text('-----------',style: TextStyle(color: Colors.white),),
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    Text('-----------',style: TextStyle(color: Colors.white),),
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    //Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins', ),),
                  ],
                )),
              ),

              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Review',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          color: Colors.black87,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Image:",textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                height: 70,
                                child: Image.asset('assets/images/c6.png'),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Name:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Milk",textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Price:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Rs.33",textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Category:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Grocery",textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Quantity:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("ml",textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Type:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Veg",textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Offer Price:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Rs.32",textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Stock:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("12",textScaleFactor: 1.5),
                            ],
                          )),
                    ],
                  ),
                ),
              ),



            Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20,top: 30 ),
                child: MaterialButton(onPressed: (){

                }, child: Text('Edit',style: TextStyle(color: Colors.white,fontSize: 18),)
                  ,color: Colors.lightBlue.shade500,
                  height: 40,
                ),
              ),


              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 30),
                child: MaterialButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessfulAdd(token:token, id:id),));
                }, child: Text('Review And Post',style: TextStyle(color: Colors.white,fontSize: 18),)
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

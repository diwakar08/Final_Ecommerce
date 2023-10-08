import 'dart:io';
import 'package:e_commerce/sucessfully_add.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class ReviewListed extends StatefulWidget {
  String productImage = '';
  String productName = '';
  String productCategory='';
  String productMRPPrice = '';
  String productOfferPrice = '';
  String productQuantity = '';
  String productUnit = '';
  String productType = '';
  String description = '';

    ReviewListed({Key? key,required this.productName,required this.productImage,required this.productCategory,required this.productMRPPrice,required this.productOfferPrice,required this.productQuantity,required this.productUnit,required this.productType,required this.description}) : super(key: key);

  @override
  _ReviewListedState createState() => _ReviewListedState();
}

class _ReviewListedState extends State<ReviewListed> {

  @override
  Widget build(BuildContext context) {
   String pName = widget.productName;
   String pImage = widget.productImage;
   String pCategory  = widget.productCategory;
   String pPrice  = widget.productMRPPrice;
   String pOfferPrice  = widget.productOfferPrice;
   String pQuantity  = widget.productQuantity;
   String pUnit  = widget.productUnit;
   String pType  = widget.productType;
   String pDescription  = widget.description;

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
                                child: Image.network('https://in.images.search.yahoo.com/search/images;_ylt=Awr1QKo3uiJl9u41Pjy9HAx.;_ylu=c2VjA3NlYXJjaARzbGsDYnV0dG9u;_ylc=X1MDMjExNDcyMzAwNQRfcgMyBGZyA21jYWZlZQRmcjIDcDpzLHY6aSxtOnNiLXRvcARncHJpZANxMl9JN0R5RFJBV2EwUEx4TzI2R2tBBG5fcnNsdAMwBG5fc3VnZwMxBG9yaWdpbgNpbi5pbWFnZXMuc2VhcmNoLnlhaG9vLmNvbQRwb3MDMARwcXN0cgMEcHFzdHJsAzAEcXN0cmwDMjAEcXVlcnkDaW1hZ2UlMjBwZXJzb24lMjBwcm9maWxlBHRfc3RtcAMxNjk2Nzc0NzI2?p=image+person+profile&fr=mcafee&fr2=p%3As%2Cv%3Ai%2Cm%3Asb-top&ei=UTF-8&x=wrt&type=E210IN885G0#id=70&iurl=https%3A%2F%2Fcdn3.iconfinder.com%2Fdata%2Ficons%2Favatars-flat%2F33%2Fman_5-1024.png&action=click'),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Category:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pCategory,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Name:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pName,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Price:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pPrice,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Offer Price:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pOfferPrice,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Quantity:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pQuantity,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Unit:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pUnit,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Type:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pType,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Description:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(pDescription,textScaleFactor: 1.5),
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
                   Navigator.pop(context);
                }, child: Text('Edit',style: TextStyle(color: Colors.white,fontSize: 18),)
                  ,color: Colors.lightBlue.shade500,
                  height: 40,
                ),
              ),


              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 30),
                child: MaterialButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessfulAdd(),));
                }, child: Text('Review And Post',style: TextStyle(color: Colors.white,fontSize: 18),)
                  ,color: Colors.lightBlue.shade700,
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
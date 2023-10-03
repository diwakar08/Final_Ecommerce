import 'dart:io';
import 'package:e_commerce/sucessfully_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class UpdateProducts extends StatefulWidget {
  String productImage = '';
  String productName = '';
  String productCategory='';
  String productSubCategory='';
  String productMRPPrice = '';
  String productOfferPrice = '';
  String productQuantity = '';
  String productType = '';
  bool stockTF = true;
  String stockIO = '';
  String description = '';
   UpdateProducts({Key? key ,required this.productName,required this.productImage,required this.productCategory,required this.productSubCategory,required this.productMRPPrice,required this.productOfferPrice,required this.productQuantity,required this.stockTF,required this.stockIO,required this.productType,required this.description}) : super(key: key);

  @override
  _UpdateProductsState createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {

  late String s = widget.stockIO;
  late bool _switchValue = widget.stockTF;
  String stock = 'In Stock';
  late String Image = widget.productImage;

  late String pType = widget.productType;
  var items = [
    'gm',
    'ml',
    'pic',
  ];
  var items2 = [
    'Veg',

    'Non Veg',
    'Not required',
  ];

  @override
  Widget build(BuildContext context) {

    final pName = TextEditingController();
    pName.text = widget.productName;
    final pCategory = TextEditingController();
    pCategory.text = widget.productCategory;
    final pSCategory = TextEditingController();
    pSCategory.text = widget.productSubCategory;
    final pPrice = TextEditingController();
    pPrice.text = widget.productMRPPrice;
    final pOfferPrice = TextEditingController();
    pOfferPrice.text = widget.productOfferPrice;
    final pQuantity = TextEditingController();
    pQuantity.text = widget.productQuantity;
    final description = TextEditingController();
    description.text = widget.description;


    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Update Product",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),


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
                height: 35,

                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade900,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                      width: 73,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      child: Center(child: Text('Update',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),

                    //Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins', ),),
                  ],
                )),
              ),

              Container(

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoSwitch(
                                activeColor: Colors.red,
                                value: _switchValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    s = value == false ? 'In stock' : 'Out of stock';
                                    _switchValue = value;

                                  });
                                },
                              ),
                              Container(

                                margin: EdgeInsets.only(left: 0),
                                child: Center(
                                  child: Text(s,
                                      style: TextStyle(
                                          color: Colors.green.shade900,
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold
                                      )),
                                ),
                              ),
                              Container(

                                child: MaterialButton(onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(),));
                                }, child: Text('Update Stock',style: TextStyle(color: Colors.white,fontSize: 15),)
                                  ,color: Colors.lightBlue.shade500,
                                  height: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(right: 10, left: 15, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: 28,
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
                        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(Image),

                        ),
                      ),
                      Container(

                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Text(
                          '     Image',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: pCategory,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),

                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Text(
                          'SubCategory',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: pSCategory,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),

                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: pName,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),

                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Text(
                          'Price (Rs)',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: pPrice,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 25),
                        child: Text(
                          'Offer Price',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: pOfferPrice,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(

                            hintText: '139',

                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),



                          ),

                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 25),
                        child: Text(
                          'Quantity (ml/gm/pic)',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: pQuantity,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),



                          ),

                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 25),
                        child: Text(
                          'Product Type (Veg/Non-veg,/in case if applicable)',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: DropdownButton(
                          value: pType,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items2.map((String items2) {
                            return DropdownMenuItem(
                              value: items2,
                              child: Text(items2),
                            );
                          }).toList(),
                           onChanged: (String? newValue){
                             setState(() {
                               pType = newValue!;
                             });
                           },
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 25),
                        child: Text(
                          'Product Description',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: description,
                          style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade900
                                )
                            ),



                          ),

                        ),
                      ),

                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
                        child: MaterialButton(onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(),));
                        }, child: Text('Save And Update',style: TextStyle(color: Colors.white,fontSize: 15),)
                          ,color: Colors.lightBlue.shade500,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );


  }


}
import 'dart:io';
// import 'package:e_commerce/Learn%20Api/callapi.dart';
// import 'package:e_commerce/explandable_list.dart';
import 'package:e_commerce/review_listed.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:image_picker/image_picker.dart';


class AddProduct extends StatefulWidget {
  final String token, id;
  const AddProduct({Key? key, required  this.token, required this.id}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState((){});
  }

  bool viewMore = false;
  String viewML = 'View more categories';

  String productQuantity = 'ml';
  String productType = 'Veg';
  String productSubCategory='Select Sub Category';

  String category='';
  String selectedUnit = 'Kg'; // Initial unit value
  void onUnitChanged(String? newValue) {
    setState(() {
      selectedUnit = newValue ?? 'Kg';
    });
  }

  @override
  Widget build(BuildContext context) {


    String productImage = '';
    String productName = '';
    String productCategory='';
    String productMRPPrice = '';
    String productOfferPrice = '';

    var items2 = [
      'Veg',
      'Non Veg',
      'Not required',
    ];


    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Add Product",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

            Expanded(child: Icon(Icons.add_circle_outline,color: Colors.white,)),
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
                            color: Colors.grey,
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

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Add Product',
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
                          margin: EdgeInsets.only(left: 15,right: 20,top: 5),
                          child: Text(
                            'Fill your product details correctly',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        Container(

                          margin: EdgeInsets.only(right: 20,top: 20,left: 20),
                          child: Text(
                            'Choose Images',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  selectImages();
                                },
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(13)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon( Icons.camera_alt),
                                        Icon( Icons.add_circle_outline),
                                      ],
                                    )

                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(

                                    scrollDirection: Axis.horizontal,
                                      itemCount: imageFileList!.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,mainAxisSpacing: 5),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Image.file(File(imageFileList![index].path),
                                          fit: BoxFit.cover,);
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CallApi(),));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                            child: Text(
                              'Choose Category >',
                              style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),



                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    category = 'Grocery';
                                     });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(18),
                                  margin: EdgeInsets.only(top: 10,left: 20,bottom: 0),
                                  height: 70,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(13)),

                                  ),
                                  child: Image.asset('assets/images/c1.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    category = 'Cloth';
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(18),
                                  margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
                                  height: 70,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(13)),

                                  ),
                                  child: Image.asset('assets/images/c14.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    category = 'Kids';
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(18),
                                  margin: EdgeInsets.only(top: 10,left: 5,right:13,bottom: 0),
                                  height: 70,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(13))
                                  ),
                                  child: Image.asset('assets/images/c13.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    category = 'Electronic';
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(18),
                                  margin: EdgeInsets.only(top: 10,bottom: 0,right: 20),
                                  height: 70,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(13))
                                  ),
                                  child: Image.asset('assets/images/c12.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 15,right:5,bottom: 10),
                                    child: Center(child: Text(' Grocery',style: TextStyle(fontSize: 13),)))
                            ),

                            Expanded(
                              child: Container(

                                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                  child: Center(child: Text('Fashion',style: TextStyle(fontSize: 13)))
                              ),
                            ),
                            Expanded(
                              child: Container(

                                  margin: EdgeInsets.only(left: 5,right:13,bottom: 10),
                                  child: Center(child: Text('Kids',style: TextStyle(fontSize: 13)))
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  height: 35,

                                  margin: EdgeInsets.only(bottom: 10,right: 20),
                                  child: Center(child: Text('Electric',style: TextStyle(fontSize: 13)))
                              ),
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
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
                            onChanged: (value){
                              productName = value;
                            },
                            style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
                            decoration: InputDecoration(

                              hintText: 'Name of item (Ex-Oil)',

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
                            onChanged: (value){
                              productMRPPrice = value;
                            },
                            style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
                            decoration: InputDecoration(

                              hintText: 'Price of item (Ex-Rs.99)',

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
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                          child: TextField(
                            onChanged: (value){
                              productOfferPrice = value;
                            },
                            style: TextStyle(fontFamily: 'Poppins',fontSize: 16),
                            decoration: InputDecoration(

                              hintText: 'Item Offer Price(Ex-Rs99 )',

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
                            value: productType,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items2.map((String items2) {
                              return DropdownMenuItem(
                                value: items2,
                                child: Text(items2),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                productType = newValue!;
                              });
                            },
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 25),
                          child: Text(
                            'Select Quantity',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Price (In Rs.)',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(1.0),
                                      fontSize: 16,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 60,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Quantity',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(1.0),
                                      fontSize: 16,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                height: 60,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownButton<String>(
                                  items: <String>['Kg', 'L', 'Unit', 'Packet']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: onUnitChanged,
                                  value: selectedUnit,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 40,top: 20),
                          child: MaterialButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(token: widget.token, id:widget.id,),));
                          }, child: Text('Save And Continue',style: TextStyle(color: Colors.white,fontSize: 15),)
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



import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/sucessfully_add.dart';
import 'package:flutter/material.dart';
import 'add_product.dart';
import 'main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class ReviewListed extends StatefulWidget {
  List<XFile>? imageFileList = [];
  List<ItemOption> itemOptions = [];
  String productName = '';
  String productType = '';
  String description = '', token='', id='';
  String category = '';
  String subCategory1 = '';
  String subCategory2 = '';

  ReviewListed({Key? key,required this.token,required this .id ,
    required this.imageFileList,
    required this.itemOptions,
    required this.productName,
    required this.productType,
    required this.description,
    required this.category,
    required this.subCategory1,
    required this.subCategory2}) : super(key: key);

  @override
  _ReviewListedState createState() => _ReviewListedState();
}

class _ReviewListedState extends State<ReviewListed> {

  @override
  Widget build(BuildContext context) {
    String pName = widget.productName;
    String pType  = widget.productType;
    String pDescription  = widget.description;
    String token = widget.token;
    String id = widget.id;



    // Future<void> postProductData() async {
    //   final url = Uri.parse('https://api.pehchankidukan.com/seller/$id/products');
    //
    //   // Create item options
    //   final itemOptions = widget.itemOptions;
    //   List<dynamic> itemOptionsMap = itemOptions.map((item) {
    //     return {
    //       'mrpPrice': item.price,
    //       'quantity': item.quantity,
    //       'unit': item.unit,
    //       'offerPrice': item.offerPrice,
    //     };
    //   }).toList();
    //   // Create the request body
    //   // print(pDescription);
    //   // print(pName);
    //   // print(pType);
    //   final requestBody = {
    //     'productName': pName,
    //     "images": widget.imageFileList,
    //     'category': widget.category,
    //     'subCategory1': widget.subCategory1,
    //     'subCategory2': widget.subCategory2,
    //     'description': pDescription,
    //     'productDetails': itemOptionsMap
    //   };
    //
    //
    //
    //   try {
    //     print(requestBody);
    //     final response = await http.post(
    //       url,
    //       headers: <String, String>{
    //         'Content-Type': 'Multipart/form-data',
    //         'Authorization': 'Bearer ${TokenId.token}',
    //       },
    //       body: jsonEncode(requestBody),
    //     );
    //
    //     if (response.statusCode == 200) {
    //       print('POST request successful');
    //       print('Response: ${response.body}');
    //     } else {
    //       print('Failed to make POST request: ${response.statusCode}');
    //       print('Response: ${response.body}');
    //     }
    //   } catch (error) {
    //     print('Error: $error');
    //   }
    // }



    Future<void> postProductData() async {
      final url = Uri.parse('https://api.pehchankidukan.com/seller/$id/products');

      // Create item options
      final itemOptions = widget.itemOptions;
      List<dynamic> itemOptionsMap = itemOptions.map((item) {
        return {
          'mrpPrice': item.price,
          'quantity': item.quantity,
          'unit': item.unit,
          'offerPrice': item.offerPrice,
        };
      }).toList();

      try {
        var request = http.MultipartRequest('POST', url);

        request.headers['Authorization'] = 'Bearer ${TokenId.token}';

        // Add text fields to the request
        // request.fields['productName'] = pName;
        // request.fields['category'] = widget.category;
        // request.fields['subCategory1'] = widget.subCategory1;
        // request.fields['subCategory2'] = widget.subCategory2;
        // request.fields['description'] = pDescription;
        // Add each image file to the request
        if(widget.imageFileList != null)
        for (var imageFile in widget.imageFileList!) {
          int length = await imageFile.length();
          String fileName = basename(imageFile.path);
          request.files.add(http.MultipartFile(
            'images', // Field name in the form
            imageFile.readAsBytes().asStream(),
            length,
            filename: fileName,
            contentType: MediaType('image', 'jpeg'), // Adjust content type accordingly
          ));
        }

        // Add the product details
        // request.fields['productDetails'] = jsonEncode(itemOptionsMap);

        // Send the request
        final response = await request.send();

        if (response.statusCode == 200) {
          print('POST request successful');
          print('Response: ${await response.stream.bytesToString()}');
        } else {
          print('Failed to make POST request: ${response.statusCode}');
          print('Response: ${await response.stream.bytesToString()}');
        }
      } catch (error) {
        print('Error: $error');
      }
    }


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
                                height: 150,

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.imageFileList!.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisSpacing: 5),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Image.file(
                                          File(widget.imageFileList![index].path),
                                          fit: BoxFit.cover,
                                        );
                                      }),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Category:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.category,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product SubCategory1:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.subCategory1,textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product SubCategory2:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.subCategory2,textScaleFactor: 1.5),
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
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Variants:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Variant'),
                              Text('Price'),
                              Text('Offer'),
                              Text('Quantity'),
                              Text('Unit'),
                            ],
                          ),

                        ),
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: ListView.builder(
                          itemCount: widget.itemOptions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${(index+1).toString()}'),
                                  Text(widget.itemOptions[index].price),
                                  Text(widget.itemOptions[index].offerPrice),
                                  Text(widget.itemOptions[index].quantity),
                                  Text(widget.itemOptions[index].unit),
                                ],
                              ),

                            );
                          },
                        ),),



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
                  postProductData();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessfulAdd(token: widget.token, id: widget.id,),));
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
































// import 'dart:io';
// import 'package:e_commerce/sucessfully_add.dart';
// import 'package:flutter/material.dart';
// import 'add_product.dart';
// import 'main.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class ReviewListed extends StatefulWidget {
//   List<XFile>? imageFileList = [];
//   List<ItemOption> itemOptions = [];
//   String productName = '';
//   String productCategory='';
//   String productType = '';
//   String description = '';
//
//     ReviewListed({Key? key,required this.imageFileList,required this.itemOptions,required this.productName,required this.productCategory,required this.productType,required this.description}) : super(key: key);
//
//   @override
//   _ReviewListedState createState() => _ReviewListedState();
// }
//
// class _ReviewListedState extends State<ReviewListed> {
//
//   @override
//   Widget build(BuildContext context) {
//    String pName = widget.productName;
//    String pCategory  = widget.productCategory;
//    String pType  = widget.productType;
//    String pDescription  = widget.description;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 "Review",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//
//             Expanded(child: Icon(Icons.notifications,color: Colors.white,)),
//             CircleAvatar(backgroundColor: Colors.red.shade100,backgroundImage: AssetImage('assets/images/avatar.png'),radius: 18,),
//           ],
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.lightBlue.shade900,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//
//       backgroundColor: Colors.grey.shade200,
//
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//
//
//
//
//               Container(
//                 height: 45,
//
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlue.shade900,
//                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
//                 ),
//                 child: Center(child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                         borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     Text('-----------',style: TextStyle(color: Colors.white),),
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     Text('-----------',style: TextStyle(color: Colors.white),),
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     //Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins', ),),
//                   ],
//                 )),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(right: 20, left: 20, top: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         'Review',
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontFamily: 'Poppins',
//                           color: Colors.black87,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Container(
//
//                 width: double.maxFinite,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Image:",textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Container(
//                                 height: 150,
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: GridView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: widget.imageFileList!.length,
//                                       gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 1,
//                                           mainAxisSpacing: 5),
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return Image.file(
//                                           File(widget.imageFileList![index].path),
//                                           fit: BoxFit.cover,
//                                         );
//                                       }),
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Category:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Text(pCategory,textScaleFactor: 1.5),
//                             ],
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product SubCategory1:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Text(pCategory,textScaleFactor: 1.5),
//                             ],
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product SubCategory2:",textScaleFactor: 1.0,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Text(pCategory,textScaleFactor: 1.5),
//                             ],
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Name:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Text(pName,textScaleFactor: 1.5),
//                             ],
//                           )),
//
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Type:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Text(pType,textScaleFactor: 1.5),
//                             ],
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Description:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
//                               Text(pDescription,textScaleFactor: 1.5),
//                             ],
//                           )),
//                       Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Variants:",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold)),
//                             ],
//                           )),
//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20),
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Variant'),
//                               Text('Price'),
//                               Text('Offer'),
//                               Text('Quantity'),
//                               Text('Unit'),
//                             ],
//                           ),
//
//                         ),
//                       ),
//                       Container(
//                         height: 100,
//                           margin: EdgeInsets.only(left: 20,right: 20),
//                           child: ListView.builder(
//                             itemCount: widget.itemOptions.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return ListTile(
//                                 title: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text('${(index+1).toString()}'),
//                                     Text(widget.itemOptions[index].price),
//                                     Text(widget.itemOptions[index].offerPrice),
//                                     Text(widget.itemOptions[index].quantity),
//                                     Text(widget.itemOptions[index].unit),
//                                   ],
//                                 ),
//
//                               );
//                             },
//                           ),),
//
//
//
//                     ],
//                   ),
//                 ),
//               ),
//
//
//               Container(
//                 width: double.maxFinite,
//                 margin: EdgeInsets.only(left: 20,right: 20,top: 30 ),
//                 child: MaterialButton(onPressed: (){
//                    Navigator.pop(context);
//                 }, child: Text('Edit',style: TextStyle(color: Colors.white,fontSize: 18),)
//                   ,color: Colors.lightBlue.shade500,
//                   height: 40,
//                 ),
//               ),
//
//
//               Container(
//                 width: double.maxFinite,
//                 margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 30),
//                 child: MaterialButton(onPressed: (){
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessfulAdd(),));
//                 }, child: Text('Review And Post',style: TextStyle(color: Colors.white,fontSize: 18),)
//                   ,color: Colors.lightBlue.shade700,
//                   height: 40,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//
//
//   }
//
//
// }
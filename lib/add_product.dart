// import 'dart:io';
// import 'package:e_commerce/CategoryList.dart';
// import 'package:e_commerce/Learn%20Api/callapi.dart';
// import 'package:e_commerce/Quantity_add.dart';
// import 'package:e_commerce/Quantity_design.dart';

// import 'package:e_commerce/review_listed.dart';
// import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_chip_picker/multi_chip_picker.dart';

// class AddProduct extends StatefulWidget {
//   AddProduct({Key? key,}) : super(key: key);

//   @override
//   _AddProductState createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {

//   List<String> dropDownItems = ['Kg', 'L', 'Unit', 'Packet'];
//   String selectedUnit = 'Kg';

//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imageFileList = [];

//   void selectImages() async {
//     final List<XFile>? selectedImages = await
//     imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList!.addAll(selectedImages);
//     }
//     print("Image List Length:" + imageFileList!.length.toString());
//     setState((){});
//   }

//   bool viewMore = false;
//   String viewML = 'View more categories';

//   String productQuantity = 'ml';
//   String productType = 'Veg';
//   String productSubCategory='Select Sub Category';

//   String category='';

//   @override
//   Widget build(BuildContext context) {

//     final quantityController = TextEditingController();
//     final priceController = TextEditingController();
//     final offerPriceController = TextEditingController();
//     String productImage = '';
//     String productName = '';
//     String productCategory='';
//     String productDescription = '';

//     var items2 = [
//       'Veg',
//       'Non Veg',
//       'Not required',
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 "Add Product",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),

//             Expanded(child: Icon(Icons.add_circle_outline,color: Colors.white,)),
//             CircleAvatar(backgroundColor: Colors.red.shade100,backgroundImage: AssetImage('assets/images/avatar.png'),radius: 18,),
//           ],
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.lightBlue.shade900,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),

//       backgroundColor: Colors.grey.shade200,

//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               Container(
//                 height: 45,

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
//                           borderRadius: BorderRadius.all(Radius.circular(6))
//                       ),
//                       child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                     ),
//                     Text('-----------',style: TextStyle(color: Colors.white),),
//                     Container(
//                       height: 23,
//                       width: 23,
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
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

//               Container(

//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10, left: 15, top: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               child: Text(
//                                 'Add Product',
//                                 style: TextStyle(
//                                     fontSize: 28,
//                                     fontFamily: 'Poppins',
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 15,right: 20,top: 5),
//                         child: Text(
//                           'Fill your product details correctly',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),

//                       Container(

//                         margin: EdgeInsets.only(right: 20,top: 20,left: 20),
//                         child: Text(
//                           'Choose Images',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontFamily: 'Poppins',
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),

//                       Row(
//                         children: [
//                           Expanded(
//                             child: InkWell(
//                               onTap: (){
//                                 selectImages();
//                               },
//                               child: Container(
//                                   height: 100,
//                                   width: 100,
//                                   margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon( Icons.camera_alt),
//                                       Icon( Icons.add_circle_outline),
//                                     ],
//                                   )

//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 150,
//                               width: 150,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: GridView.builder(

//                                     scrollDirection: Axis.horizontal,
//                                     itemCount: imageFileList!.length,
//                                     gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 1,mainAxisSpacing: 5),
//                                     itemBuilder: (BuildContext context, int index) {
//                                       return Image.file(File(imageFileList![index].path),
//                                         fit: BoxFit.cover,);
//                                     }),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       InkWell(

//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => Category(),));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                           child: Text(
//                             'Choose Category >',
//                             style: TextStyle(
//                               fontSize: 23,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                         child: Text(
//                           category,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontFamily: 'Poppins',
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20,top: 25),
//                         child: Text(
//                           'Product Type (Veg/Non-veg,/in case if applicable)',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontFamily: 'Poppins',
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20),
//                         child: DropdownButton(
//                           value: productType,
//                           icon: const Icon(Icons.keyboard_arrow_down),
//                           items: items2.map((String items2) {
//                             return DropdownMenuItem(
//                               value: items2,
//                               child: Text(items2),
//                             );
//                           }).toList(),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               productType = newValue!;
//                             });
//                           },
//                         ),
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                         child: Text(
//                           'Product Name',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontFamily: 'Poppins',
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       Container(

//                         margin: EdgeInsets.only(left: 20,right: 20),
//                         child: TextField(
//                           onChanged: (value){
//                             productName = value;
//                           },
//                           style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
//                           decoration: InputDecoration(

//                             hintText: 'Name of item (Ex-Oil)',

//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.teal.shade900
//                                 )
//                             ),

//                           ),

//                         ),
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20,top: 25),
//                         child: Text(
//                           'Product Description',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontFamily: 'Poppins',
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
//                         child: TextField(
//                           onChanged: (value){
//                             productDescription = value;
//                           },
//                           style: TextStyle(fontFamily: 'Poppins',fontSize: 16),
//                           decoration: InputDecoration(

//                             hintText: 'Write here about product',

//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Colors.teal.shade900
//                                 )
//                             ),

//                           ),

//                         ),
//                       ),

//                       InkWell(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 25),
//                           child: Text(
//                             'Select Quantity',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: EdgeInsets.all(12),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       height: 60,
//                                       padding: EdgeInsets.all(16),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           width: 1,
//                                           color: Colors.black,
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       child: TextFormField(
//                                         controller: quantityController,
//                                         decoration: InputDecoration(
//                                           hintText: 'Quantity',
//                                           border: InputBorder.none,
//                                         ),
//                                         style: TextStyle(
//                                           color: Colors.black.withOpacity(1.0),
//                                           fontSize: 16,
//                                           fontFamily: 'Urbanist',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 16),

//                                   Container(
//                                     height: 60,
//                                     padding: EdgeInsets.all(16),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         width: 1,
//                                         color: Colors.black,
//                                       ),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: DropdownButton(
//                                       value: selectedUnit,
//                                         onChanged: (String? value) {
//                                         setState(() {
//                                           selectedUnit = value!;
//                                         });
//                                     },
//                                       items: dropDownItems
//                                           .map((String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: Text(
//                                             value,
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 16,
//                                               fontFamily: 'Urbanist',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         );
//                                       }).toList(),

//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 8,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       height: 60,
//                                       padding: EdgeInsets.all(16),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           width: 1,
//                                           color: Colors.black,
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       child: TextFormField(
//                                         controller: priceController,
//                                         decoration: InputDecoration(
//                                           hintText: 'Price (In Rs.)',
//                                           border: InputBorder.none,
//                                         ),
//                                         style: TextStyle(
//                                           color: Colors.black.withOpacity(1.0),
//                                           fontSize: 16,
//                                           fontFamily: 'Urbanist',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 16),
//                                   Expanded(
//                                     child: Container(
//                                       height: 60,
//                                       padding: EdgeInsets.all(16),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                           width: 1,
//                                           color: Colors.black,
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       child: TextFormField(
//                                         controller: offerPriceController,
//                                         decoration: InputDecoration(
//                                           hintText: 'Offer Price',
//                                           border: InputBorder.none,
//                                         ),
//                                         style: TextStyle(
//                                           color: Colors.black.withOpacity(1.0),
//                                           fontSize: 16,
//                                           fontFamily: 'Urbanist',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),

//                       Container(
//                         margin: EdgeInsets.all(5),
//                         child: MultiChipPicker(
//                           filterChips: [
//                             FilterChipData('Kg', false),
//                             FilterChipData('gm', true),
//                             FilterChipData('ml', false),
//                             FilterChipData('Unit', false),
//                             FilterChipData('Packet', false),
//                           ],
//                           onChanged: (selectedFilterChips) {

//                             print(selectedFilterChips.toString());
//                           },
//                         ),
//                       ),

//                       Container(
//                         width: double.maxFinite,
//                         margin: EdgeInsets.only(left: 20,right: 20,bottom: 40,top: 20),
//                         child: MaterialButton(onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(productName: productName,productImage: productImage,productCategory: productCategory,productMRPPrice: priceController.text,productOfferPrice: offerPriceController.text,productQuantity: quantityController.text,productUnit: selectedUnit,productType: productType,description: productDescription),));
//                         }, child: Text('Save And Continue',style: TextStyle(color: Colors.white,fontSize: 15),)
//                           ,color: Colors.lightBlue.shade500,
//                           height: 40,
//                         ),
//                       )

//                     ],
//                   ),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }

// }

import 'dart:io';
import 'package:e_commerce/CategoryList.dart';
import 'package:e_commerce/Learn%20Api/callapi.dart';
import 'package:e_commerce/Quantity_add.dart';
import 'package:e_commerce/Quantity_design.dart';

import 'package:e_commerce/review_listed.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:image_picker/image_picker.dart';

class ItemOption {
  String price;
  String quantity;
  String unit;
  String offerPrice;

  ItemOption({
    required this.price,
    required this.quantity,
    required this.unit,
    required this.offerPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'quantity': quantity,
      'unit': unit,
      'offerPrice': offerPrice,
    };
  }
}

class PriceQuantitySpinnerRow extends StatefulWidget {
  final List<ItemOption> options;
  final ValueChanged<ItemOption> onOptionAdded;
  final Function(List<TextEditingController>, List<TextEditingController>,
      List<TextEditingController>) updateInitialValue;

  PriceQuantitySpinnerRow({
    required this.options,
    required this.onOptionAdded,
    required this.updateInitialValue,
  });

  @override
  _PriceQuantitySpinnerRowState createState() =>
      _PriceQuantitySpinnerRowState();
}

class _PriceQuantitySpinnerRowState extends State<PriceQuantitySpinnerRow> {
  ItemOption newItem = ItemOption(
    price: '',
    quantity: '',
    unit: 'Kg',
    offerPrice: '',
  );
  List<String> dropDownItems = ['Kg', 'L', 'Unit', 'Packet'];

  void addOption() {

    widget.onOptionAdded(newItem);
    newItem = ItemOption(
      price: '',
      quantity: '',
      unit: 'Kg',
      offerPrice: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: widget.options.map((option) {
            return Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
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
                              controller:
                              TextEditingController(text: option.quantity),
                              onChanged: (value) => option.quantity = value,
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
                            value: option.unit,
                            onChanged: (String? value) {
                              setState(() {
                                option.unit = value!;
                              });
                            },
                            items: dropDownItems.map((String value) {
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
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
                              controller:
                              TextEditingController(text: option.price),
                              onChanged: (value) => option.price = value,
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
                              controller: TextEditingController(
                                  text: option.offerPrice),
                              onChanged: (value) => option.offerPrice = value,
                              decoration: InputDecoration(
                                hintText: 'Offer Price',
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
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        ElevatedButton(onPressed: addOption, child: Text("Add items")),
        // ElevatedButton(
        //     onPressed: () {
        //       for (var data in widget.options) {
        //         print(data.price);
        //         print(data.offerPrice);
        //         print(data.quantity);
        //         print(data.unit);
        //       }
        //     },
        //     child: Text("Tap")),
      ],
    );
  }
}

// class PriceQuantitySpinnerRow extends StatefulWidget {
//   final List<ItemOption> options;
//   final ValueChanged<ItemOption> onOptionAdded;
//   final Function(List<TextEditingController>, List<TextEditingController>,
//       List<TextEditingController>) updateInitialValue;

//   PriceQuantitySpinnerRow({
//     required this.options,
//     required this.onOptionAdded,
//     required this.updateInitialValue,
//   });

//   @override
//   _PriceQuantitySpinnerRowState createState() =>
//       _PriceQuantitySpinnerRowState();
// }

// class _PriceQuantitySpinnerRowState extends State<PriceQuantitySpinnerRow> {
//   List<Widget> dynamicFields = [];
//   List<TextEditingController> priceControllers = [];
//   List<TextEditingController> offerPriceControllers = [];
//   List<TextEditingController> quantityControllers = [];

//   List<String> dropDownItems = ['Kg', 'L', 'Unit', 'Packet'];
//   String selectedUnit = 'Kg';
//   // List<String> weekdays = [
//   //   'Kg',
//   //   'L',
//   //   'Unit',
//   //   'Packet',
//   // ];
//   // List<String> selectedWeekdays = [];

//   // void _onChipSelected(String weekday) {
//   //   setState(() {
//   //     if (selectedWeekdays.contains(weekday)) {
//   //       selectedWeekdays.remove(weekday);
//   //     } else {
//   //       selectedWeekdays.add(weekday);
//   //     }
//   //     // widget.onSelectionChanged(selectedWeekdays);
//   //   });
//   // }

//   // void onUnitChanged(newValue) {
//   //
//   //
//   //   print(selectedUnit);
//   // }
//   void addOption() {
//     final priceController = TextEditingController();
//     priceControllers.add(priceController);
//     final quantityController = TextEditingController();
//     quantityControllers.add(quantityController);
//     final offerPriceController = TextEditingController();
//     offerPriceControllers.add(offerPriceController);

//     widget.updateInitialValue(
//         priceControllers, offerPriceControllers, quantityControllers);

//     dynamicFields.add(
//       Container(
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 60,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: TextFormField(
//                         controller: quantityController,
//                         decoration: InputDecoration(
//                           hintText: 'Quantity',
//                           border: InputBorder.none,
//                         ),
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(1.0),
//                           fontSize: 16,
//                           fontFamily: 'Urbanist',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Container(
//                     height: 60,
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 1,
//                         color: Colors.black,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: DropdownButton<String>(
//                       value: selectedUnit,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedUnit = newValue!;
//                         });
//                       },
//                       items: dropDownItems.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontFamily: 'Urbanist',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 60,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: TextFormField(
//                         controller: priceController,
//                         decoration: InputDecoration(
//                           hintText: 'Price (In Rs.)',
//                           border: InputBorder.none,
//                         ),
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(1.0),
//                           fontSize: 16,
//                           fontFamily: 'Urbanist',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: Container(
//                       height: 60,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.black,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: TextFormField(
//                         controller: offerPriceController,
//                         decoration: InputDecoration(
//                           hintText: 'Offer Price',
//                           border: InputBorder.none,
//                         ),
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(1.0),
//                           fontSize: 16,
//                           fontFamily: 'Urbanist',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     // Clear text fields
//     priceController.clear();
//     quantityController.clear();
//     offerPriceController.clear();
//     setState(() {
//       selectedUnit = 'Kg'; // Reset unit to 'Kg'
//     });
//   }

//   // void addOption() {
//   //   final priceController = TextEditingController();
//   //   priceControllers.add(priceController);
//   //   final quantityController = TextEditingController();
//   //   quantityControllers.add(quantityController);
//   //   final offerPriceController = TextEditingController();
//   //   offerPriceControllers.add(quantityController);

//   //   widget.updateInitialValue(
//   //       priceControllers, offerPriceControllers, quantityControllers);

//   //   dynamicFields.add(
//   //     Container(
//   //       child: Padding(
//   //         padding: EdgeInsets.all(12),
//   //         child: Column(
//   //           children: [
//   //             Row(
//   //               children: [
//   //                 Expanded(
//   //                   child: Container(
//   //                     height: 60,
//   //                     padding: EdgeInsets.all(16),
//   //                     decoration: BoxDecoration(
//   //                       border: Border.all(
//   //                         width: 1,
//   //                         color: Colors.black,
//   //                       ),
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                     child: TextFormField(
//   //                       controller: quantityController,
//   //                       decoration: InputDecoration(
//   //                         hintText: 'Quantity',
//   //                         border: InputBorder.none,
//   //                       ),
//   //                       style: TextStyle(
//   //                         color: Colors.black.withOpacity(1.0),
//   //                         fontSize: 16,
//   //                         fontFamily: 'Urbanist',
//   //                         fontWeight: FontWeight.w400,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 SizedBox(width: 16),
//   //                 // Expanded(
//   //                 //   child: Wrap(
//   //                 //     spacing: 8.0,
//   //                 //     runSpacing: 4.0,
//   //                 //     children: weekdays.map((weekday) {
//   //                 //       return ChoiceChip(
//   //                 //         label: Text(weekday),
//   //                 //         selected: selectedWeekdays.contains(weekday),
//   //                 //         onSelected: (_) => _onChipSelected(weekday),
//   //                 //       );
//   //                 //     }).toList(),
//   //                 //   ),
//   //                 // ),

//   //                 Container(
//   //                   height: 60,
//   //                   padding: EdgeInsets.all(16),
//   //                   decoration: BoxDecoration(
//   //                     border: Border.all(
//   //                       width: 1,
//   //                       color: Colors.black,
//   //                     ),
//   //                     borderRadius: BorderRadius.circular(12),
//   //                   ),
//   //                   child: DropdownButton<String>(
//   //                     value: selectedUnit,
//   //                     onChanged: (String? newValue) {
//   //                       setState(() {
//   //                         print(newValue);
//   //                         selectedUnit = newValue!;
//   //                       });
//   //                     },
//   //                     items: dropDownItems
//   //                         .map<DropdownMenuItem<String>>((String value) {
//   //                       return DropdownMenuItem<String>(
//   //                         value: value,
//   //                         child: Text(
//   //                           value,
//   //                           style: TextStyle(
//   //                             color: Colors.black,
//   //                             fontSize: 16,
//   //                             fontFamily: 'Urbanist',
//   //                             fontWeight: FontWeight.w400,
//   //                           ),
//   //                         ),
//   //                       );
//   //                     }).toList(),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //             SizedBox(
//   //               height: 8,
//   //             ),
//   //             Row(
//   //               children: [
//   //                 Expanded(
//   //                   child: Container(
//   //                     height: 60,
//   //                     padding: EdgeInsets.all(16),
//   //                     decoration: BoxDecoration(
//   //                       border: Border.all(
//   //                         width: 1,
//   //                         color: Colors.black,
//   //                       ),
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                     child: TextFormField(
//   //                       controller: priceController,
//   //                       decoration: InputDecoration(
//   //                         hintText: 'Price (In Rs.)',
//   //                         border: InputBorder.none,
//   //                       ),
//   //                       style: TextStyle(
//   //                         color: Colors.black.withOpacity(1.0),
//   //                         fontSize: 16,
//   //                         fontFamily: 'Urbanist',
//   //                         fontWeight: FontWeight.w400,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 SizedBox(width: 16),
//   //                 Expanded(
//   //                   child: Container(
//   //                     height: 60,
//   //                     padding: EdgeInsets.all(16),
//   //                     decoration: BoxDecoration(
//   //                       border: Border.all(
//   //                         width: 1,
//   //                         color: Colors.black,
//   //                       ),
//   //                       borderRadius: BorderRadius.circular(12),
//   //                     ),
//   //                     child: TextFormField(
//   //                       controller: offerPriceController,
//   //                       decoration: InputDecoration(
//   //                         hintText: 'Offer Price',
//   //                         border: InputBorder.none,
//   //                       ),
//   //                       style: TextStyle(
//   //                         color: Colors.black.withOpacity(1.0),
//   //                         fontSize: 16,
//   //                         fontFamily: 'Urbanist',
//   //                         fontWeight: FontWeight.w400,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );

//   //   // print('object');
//   //   // final newItem = ItemOption(
//   //   //   price: priceController.text,
//   //   //   quantity: quantityController.text,
//   //   //   unit: selectedUnit,
//   //   // );
//   //   //
//   //   // widget.onOptionAdded(newItem);
//   //   //
//   //   // // Clear text fields
//   //   // print(priceController.text);
//   //   // // priceController.clear();
//   //   // // quantityController.clear();
//   //   // setState(() {
//   //   //   selectedUnit = 'Kg'; // Reset unit to 'Kg'
//   //   // });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Column(
//           children: dynamicFields,
//         ),
//         // QuantityDesign(),
//         ElevatedButton(onPressed: addOption, child: Text("Add items")),
//       ],
//     );
//   }
// }

class AddProduct extends StatefulWidget {
  AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<ItemOption> itemOptions = [];

  void handleOptionAdded(ItemOption newItem) {
    setState(() {
      itemOptions.add(newItem);
    });
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  bool viewMore = false;
  String viewML = 'View more categories';

  String productQuantity = 'ml';
  String productType = 'Veg';
  String productSubCategory = 'Select Sub Category';

  String category = '';

  List<TextEditingController> priceControllers = [];
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> offerPriceControllers = [];

  @override
  Widget build(BuildContext context) {
    String productImage = '';
    String productName = '';
    String productCategory = '';
    String productMRPPrice = '';
    String productOfferPrice = '';
    String productDescription = '';

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
            Expanded(
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                )),
            CircleAvatar(
              backgroundColor: Colors.red.shade100,
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 18,
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
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade900,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                          child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Text(
                          '-----------',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                          child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Text(
                          '-----------',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                          child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              )),
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 20, top: 5),
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
                        margin: EdgeInsets.only(right: 20, top: 20, left: 20),
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
                              onTap: () {
                                selectImages();
                              },
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt),
                                      Icon(Icons.add_circle_outline),
                                    ],
                                  )),
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
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 5),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.file(
                                        File(imageFileList![index].path),
                                        fit: BoxFit.cover,
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Category(),
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
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
                        margin: EdgeInsets.only(left: 20, right: 20),
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
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          onChanged: (value) {
                            productName = value;
                          },
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'Name of item (Ex-Oil)',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.teal.shade900)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
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
                        margin:
                        EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: TextField(
                          onChanged: (value) {
                            productDescription = value;
                          },
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Write here about product',
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.teal.shade900)),
                          ),
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                          child: Text(
                            'Select Quantity',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                            ),
                          ),
                      ),
                      PriceQuantitySpinnerRow(
                          options: itemOptions,
                          onOptionAdded: handleOptionAdded,
                          updateInitialValue:
                              (pControllers, oController, qController) {
                            setState(() {
                              priceControllers = pControllers;
                              offerPriceControllers = oController;
                              quantityControllers = qController;
                            });

                            print(itemOptions[1]);
                            print(quantityControllers[1]);
                            print(offerPriceControllers[1]);
                            print("priceControllers.toString()");

                            ListView.builder(
                              itemCount: priceControllers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title:
                                  Text(priceControllers[index].toString()),
                                );
                              },
                            );
                          }),

                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 40, top: 20),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewListed(
                                    itemOptions: itemOptions,
                                    productName: productName,
                                    imageFileList: imageFileList,
                                    productCategory: productCategory,
                                    productType: productType,
                                    description: productDescription,
                                  ),
                                ));
                          },
                          child: Text(
                            'Save And Continue',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          color: Colors.lightBlue.shade500,
                          height: 40,
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

    );

  }

}

















































// import 'dart:io';
// import 'package:e_commerce/CategoryList.dart';
// import 'package:e_commerce/Learn%20Api/callapi.dart';
// import 'package:e_commerce/Quantity_add.dart';
// import 'package:e_commerce/Quantity_design.dart';
//
// import 'package:e_commerce/review_listed.dart';
// import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:image_picker/image_picker.dart';
//
//
//
// class ItemOption {
//   String price;
//   String quantity;
//   String unit;
//
//   ItemOption({
//     required this.price,
//     required this.quantity,
//     required this.unit,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'price': price,
//       'quantity': quantity,
//       'unit': unit,
//     };
//   }
// }
//
// class PriceQuantitySpinnerRow extends StatefulWidget {
//   final List<ItemOption> options;
//   final ValueChanged<ItemOption> onOptionAdded;
//   final Function( List<TextEditingController>,  List<TextEditingController>,List<TextEditingController>) updateInitialValue;
//
//   PriceQuantitySpinnerRow({
//     required this.options,
//     required this.onOptionAdded,
//     required this.updateInitialValue,
//   });
//
//   @override
//   _PriceQuantitySpinnerRowState createState() =>
//       _PriceQuantitySpinnerRowState();
// }
//
// class _PriceQuantitySpinnerRowState extends State<PriceQuantitySpinnerRow> {
//   List<Widget> dynamicFields = [];
//   List<TextEditingController> priceControllers = [];
//   List<TextEditingController> offerPriceControllers = [];
//   List<TextEditingController> quantityControllers = [];
//
//
//
//   List<String> dropDownItems = ['Kg', 'L', 'Unit', 'Packet'];
//   String selectedUnit = 'Kg';
//   // TextEditingController priceController = TextEditingController();
//   // TextEditingController quantityController = TextEditingController();
//
//   // final Function(List<String>) onSelectionChanged;
//   // MultiSelectChipField({
//   //   required this.onSelectionChanged,
//   // });
//   List<String> weekdays = [
//     'Kg',
//     'L',
//     'Unit',
//     'Packet',
//   ];
//   List<String> selectedWeekdays = [];
//
//   void _onChipSelected(String weekday) {
//     setState(() {
//       if (selectedWeekdays.contains(weekday)) {
//         selectedWeekdays.remove(weekday);
//       } else {
//         selectedWeekdays.add(weekday);
//       }
//      // widget.onSelectionChanged(selectedWeekdays);
//     });
//   }
//
//
//
//   // void onUnitChanged(newValue) {
//   //
//   //
//   //   print(selectedUnit);
//   // }
//
//   void addOption() {
//     final priceController = TextEditingController();
//     priceControllers.add(priceController);
//     final quantityController = TextEditingController();
//     quantityControllers.add(quantityController);
//     final offerPriceController = TextEditingController();
//     offerPriceControllers.add(quantityController);
//
//
//     // setState(() {
//       widget.updateInitialValue(priceControllers,offerPriceControllers,quantityControllers);
//
//       dynamicFields.add(
//           Container(
//             child: Padding(
//               padding: EdgeInsets.all(12),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 60,
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 1,
//                               color: Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: TextFormField(
//                             controller: quantityController,
//                             decoration: InputDecoration(
//                               hintText: 'Quantity',
//                               border: InputBorder.none,
//                             ),
//                             style: TextStyle(
//                               color: Colors.black.withOpacity(1.0),
//                               fontSize: 16,
//                               fontFamily: 'Urbanist',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: Wrap(
//                           spacing: 8.0,
//                           runSpacing: 4.0,
//                           children: weekdays.map((weekday) {
//                             return ChoiceChip(
//                               label: Text(weekday),
//                               selected: selectedWeekdays.contains(weekday),
//                               onSelected: (_) => _onChipSelected(weekday),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//
//                       // Container(
//                       //   height: 60,
//                       //   padding: EdgeInsets.all(16),
//                       //   decoration: BoxDecoration(
//                       //     border: Border.all(
//                       //       width: 1,
//                       //       color: Colors.black,
//                       //     ),
//                       //     borderRadius: BorderRadius.circular(12),
//                       //   ),
//                       //   child: DropdownButton(
//                       //     value: selectedUnit,
//                       //       onChanged: (String? value) {
//                       //       setState(() {
//                       //         selectedUnit = value!;
//                       //       });
//                       //   },
//                       //     items: dropDownItems
//                       //         .map((String value) {
//                       //       return DropdownMenuItem<String>(
//                       //         value: value,
//                       //         child: Text(
//                       //           value,
//                       //           style: TextStyle(
//                       //             color: Colors.black,
//                       //             fontSize: 16,
//                       //             fontFamily: 'Urbanist',
//                       //             fontWeight: FontWeight.w400,
//                       //           ),
//                       //         ),
//                       //       );
//                       //     }).toList(),
//                       //
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   SizedBox(height: 8,),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 60,
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 1,
//                               color: Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: TextFormField(
//                             controller: priceController,
//                             decoration: InputDecoration(
//                               hintText: 'Price (In Rs.)',
//                               border: InputBorder.none,
//                             ),
//                             style: TextStyle(
//                               color: Colors.black.withOpacity(1.0),
//                               fontSize: 16,
//                               fontFamily: 'Urbanist',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: Container(
//                           height: 60,
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 1,
//                               color: Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: TextFormField(
//                             controller: offerPriceController,
//                             decoration: InputDecoration(
//                               hintText: 'Offer Price',
//                               border: InputBorder.none,
//                             ),
//                             style: TextStyle(
//                               color: Colors.black.withOpacity(1.0),
//                               fontSize: 16,
//                               fontFamily: 'Urbanist',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       );
//     // });
//
//     // print('object');
//     // final newItem = ItemOption(
//     //   price: priceController.text,
//     //   quantity: quantityController.text,
//     //   unit: selectedUnit,
//     // );
//     //
//     // widget.onOptionAdded(newItem);
//     //
//     // // Clear text fields
//     // print(priceController.text);
//     // // priceController.clear();
//     // // quantityController.clear();
//     // setState(() {
//     //   selectedUnit = 'Kg'; // Reset unit to 'Kg'
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
// Column(
//   children: dynamicFields,
// ),
//           // QuantityDesign(),
//           ElevatedButton(
//             onPressed: addOption,
//             child: Text("Add items")
//           ),
//     ],
//     );
//   }
// }
//
//
// class AddProduct extends StatefulWidget {
//    AddProduct({Key? key,}) : super(key: key);
//
//   @override
//   _AddProductState createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct> {
//   List<ItemOption> itemOptions = [];
//
//   void handleOptionAdded(ItemOption newItem) {
//     setState(() {
//       itemOptions.add(newItem);
//     });
//   }
//
//
//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imageFileList = [];
//
//   void selectImages() async {
//     final List<XFile>? selectedImages = await
//     imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList!.addAll(selectedImages);
//     }
//     print("Image List Length:" + imageFileList!.length.toString());
//     setState((){});
//   }
//
//   bool viewMore = false;
//   String viewML = 'View more categories';
//
//   String productQuantity = 'ml';
//   String productType = 'Veg';
//   String productSubCategory='Select Sub Category';
//
//   String category='';
//
//   List<TextEditingController> priceControllers = [];
//   List<TextEditingController> quantityControllers = [];
//   List<TextEditingController> offerPriceControllers = [];
//
//   @override
//   Widget build(BuildContext context) {
//
//     String productImage = '';
//     String productName = '';
//     String productCategory='';
//     String productMRPPrice = '';
//     String productOfferPrice = '';
//     String productDescription = '';
//
//
//     var items2 = [
//       'Veg',
//       'Non Veg',
//       'Not required',
//     ];
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 "Add Product",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//
//             Expanded(child: Icon(Icons.add_circle_outline,color: Colors.white,)),
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
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//
//                 Container(
//                   height: 45,
//
//                   decoration: BoxDecoration(
//                       color: Colors.lightBlue.shade900,
//                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
//                   ),
//                   child: Center(child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 23,
//                         width: 23,
//                         decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.all(Radius.circular(6))
//                         ),
//                         child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                       ),
//                       Text('-----------',style: TextStyle(color: Colors.white),),
//                       Container(
//                         height: 23,
//                         width: 23,
//                         decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.all(Radius.circular(6))
//                         ),
//                         child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                       ),
//                       Text('-----------',style: TextStyle(color: Colors.white),),
//                       Container(
//                         height: 23,
//                         width: 23,
//                         decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.all(Radius.circular(6))
//                         ),
//                         child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//                       ),
//                       //Text('Add Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Poppins', ),),
//                     ],
//                   )),
//                 ),
//
//                 Container(
//
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(right: 10, left: 15, top: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Text(
//                                   'Add Product',
//                                   style: TextStyle(
//                                       fontSize: 28,
//                                       fontFamily: 'Poppins',
//                                       color: Colors.black87,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 15,right: 20,top: 5),
//                           child: Text(
//                             'Fill your product details correctly',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//
//                         Container(
//
//                           margin: EdgeInsets.only(right: 20,top: 20,left: 20),
//                           child: Text(
//                             'Choose Images',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//
//                         Row(
//                           children: [
//                             Expanded(
//                               child: InkWell(
//                                 onTap: (){
//                                   selectImages();
//                                 },
//                                 child: Container(
//                                     height: 100,
//                                     width: 100,
//                                     margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.all(Radius.circular(13)),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon( Icons.camera_alt),
//                                         Icon( Icons.add_circle_outline),
//                                       ],
//                                     )
//
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Container(
//                                 height: 150,
//                                 width: 150,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: GridView.builder(
//
//                                     scrollDirection: Axis.horizontal,
//                                       itemCount: imageFileList!.length,
//                                       gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 1,mainAxisSpacing: 5),
//                                       itemBuilder: (BuildContext context, int index) {
//                                         return Image.file(File(imageFileList![index].path),
//                                           fit: BoxFit.cover,);
//                                       }),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         InkWell(
//
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => Category(),));
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                             child: Text(
//                               'Choose Category >',
//                               style: TextStyle(
//                                 fontSize: 23,
//                                 fontFamily: 'Poppins',
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                           child: Text(
//                             category,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                           child: Text(
//                             'Product Name',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                         Container(
//
//
//                           margin: EdgeInsets.only(left: 20,right: 20),
//                           child: TextField(
//                             onChanged: (value){
//                               productName = value;
//                             },
//                             style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
//                             decoration: InputDecoration(
//
//                               hintText: 'Name of item (Ex-Oil)',
//
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.teal.shade900
//                                   )
//                               ),
//
//
//
//                             ),
//
//                           ),
//                         ),
//
//
//                         Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 25),
//                           child: Text(
//                             'Product Description',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
//                           child: TextField(
//                             onChanged: (value){
//                               productDescription = value;
//                             },
//                             style: TextStyle(fontFamily: 'Poppins',fontSize: 16),
//                             decoration: InputDecoration(
//
//                               hintText: 'Write here about product',
//
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.teal.shade900
//                                   )
//                               ),
//
//
//
//                             ),
//
//                           ),
//                         ),
//
//                         Container(
//                           margin: EdgeInsets.only(left: 20,right: 20,top: 25),
//                           child: Text(
//                             'Product Type (Veg/Non-veg,/in case if applicable)',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20,right: 20),
//                           child: DropdownButton(
//                             value: productType,
//                             icon: const Icon(Icons.keyboard_arrow_down),
//                             items: items2.map((String items2) {
//                               return DropdownMenuItem(
//                                 value: items2,
//                                 child: Text(items2),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 productType = newValue!;
//                               });
//                             },
//                           ),
//                         ),
//
//                         InkWell(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
//                           },
//                           child: Container(
//                               margin: EdgeInsets.only(left: 20,right: 20,top: 25),
//                               child: Text(
//                                 'Select Quantity',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontFamily: 'Poppins',
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ),
//                         ),
//                         PriceQuantitySpinnerRow(
//                           options: itemOptions,
//                           onOptionAdded: handleOptionAdded,
//
//                           updateInitialValue: (pControllers,oController,qController){
//                             setState(() {
//                              priceControllers = pControllers;
//                              offerPriceControllers = oController;
//                              quantityControllers = qController;
//                             });
//
//                              print(priceControllers[1]);
//                              print(quantityControllers[1]);
//                              print(offerPriceControllers[1]);
//                              print("priceControllers.toString()");
//
//                              ListView.builder(
//                               itemCount: priceControllers.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return ListTile(
//                                   title: Text(priceControllers[index].toString()),
//                                 );
//                               },
//                             );
//                           }
//                         ),
//
//
//
//                         Container(
//                           width: double.maxFinite,
//                           margin: EdgeInsets.only(left: 20,right: 20,bottom: 40,top: 20),
//                           child: MaterialButton(onPressed: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewListed(productName: productName,productImage: productImage,productCategory: productCategory,productMRPPrice: productMRPPrice,productOfferPrice: productOfferPrice,productQuantity: productQuantity,productType: productType,description: productDescription),));
//                           }, child: Text('Save And Continue',style: TextStyle(color: Colors.white,fontSize: 15),)
//                             ,color: Colors.lightBlue.shade500,
//                             height: 40,
//                           ),
//                         )
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//
//
//               ],
//             ),
//           ),
//       ),
//     );
//   }
//
//
// }
//
//
//
//

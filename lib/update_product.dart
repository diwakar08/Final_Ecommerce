import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/review_listed.dart';
import 'package:e_commerce/services/User_api.dart';
import 'package:e_commerce/services/tokenId.dart';
import 'package:e_commerce/sucessfully_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_product.dart';
import 'apis/ProductModel.dart';
import 'categoryList.dart';
import 'main.dart';
import 'main_dashboard.dart';
import 'package:http/http.dart' as http;


// class ItemOption {
//   String price;
//   String quantity;
//   String unit;
//   String offerPrice;
//
//   ItemOption({
//     required this.price,
//     required this.quantity,
//     required this.unit,
//     required this.offerPrice,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'price': price,
//       'quantity': quantity,
//       'unit': unit,
//       'offerPrice': offerPrice,
//     };
//   }
// }

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
    unit: 'kg',
    offerPrice: '',
  );
  List<String> dropDownItems = ["kg",
    "litre",
    "piece",
    "packet",
    "box",
    "bottle",
    "can",
    "bag",
    "sack",
    "tin",
    "other",];


  void addOption() {

    widget.onOptionAdded(newItem);
    newItem = ItemOption(
      price: '',
      quantity: '',
      unit: 'kg',
      offerPrice: '',
    );
  }

  bool _validate4 = false;
  bool _validate5 = false;
  bool _validate6 = false;

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
                                errorText: _validate4 ? 'Value Can\'t Be Empty' : null,
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
                        InkWell(
                          onTap: () {

                          },
                          child: Icon( Icons.delete_outlined, ),
                        )
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
                                errorText: _validate5 ? 'Value Can\'t Be Empty' : null,
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
                                errorText: _validate6 ? 'Value Can\'t Be Empty' : null,
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
        Container(
            margin: EdgeInsets.only(left: 20),
            child: ElevatedButton(onPressed: addOption, child: Text("Add items"),)),
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




class UpdateProducts extends StatefulWidget {
  // String productImage = '';
  String productName = '';
  String productCategory='';
  String productSubCategory1='';
  String productSubCategory2='';
  final List quantityPricing;
  // String productType = '';
  bool stockTF = true;
  String stockIO = '';
  String description = '';
  final String token, id;
  final String pid;
  UpdateProducts({Key? key ,required this.pid,required this.token,required this.id ,required this.productName,
    // required this.productImage,
    required this.productCategory,required this.productSubCategory1,
    required this.productSubCategory2,required this.stockTF,required this.stockIO,
    // required this.productType,
    required this.description, required this.quantityPricing}) : super(key: key);

  @override
  _UpdateProductsState createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {

  List<ItemOption> itemOptions = [];
late List dummyProductList;
  void handleOptionAdded(ItemOption itemOption) {
    // dummyProductList.add(QuantityPricing(offerPrice: int.parse(itemOption.offerPrice),
    //     quantity: itemOption.price, mrpPrice: double.parse(itemOption.quantity), unit: itemOption.unit));
    setState(() {
      itemOptions.add(itemOption);

    });
  }
  // void handleOptionDeleted() {
  //   // dummyProductList.add(QuantityPricing(offerPrice: int.parse(itemOption.offerPrice),
  //   //     quantity: itemOption.price, mrpPrice: double.parse(itemOption.quantity), unit: itemOption.unit));
  //   setState(() {
  //     itemOptions.add();
  //
  //   });
  // }

  late String s = widget.stockIO;
  late bool _switchValue = widget.stockTF;
  String stock = 'In Stock';
  late String Image ;//widget.productImage;

  late String pType = 'Veg';
  // var items = [
  //   'gm',
  //   'ml',
  //   'pic',
  // ];
  var items2 = [
    'Veg',
    'Non Veg',
    'Not required',
  ];

  String units = 'kg';
  List<String> dropDownItems = [
    "kg",
    "litre",
    "piece",
    "packet",
    "box",
    "bottle",
    "can",
    "bag",
    "sack",
    "tin",
    "other",];
  // [
  //   {
  //     "quantity": "1",
  //     "mrpPrice": 100.0,
  //     "offerPrice": 80.0,
  //     "unit": "Kg",
  //   },
  //   {
  //     "quantity": "2",
  //     "mrpPrice": 50.0,
  //     "offerPrice": 45.0,
  //     "unit": "litre",
  //   },
  //   {
  //     "quantity": "5",
  //     "mrpPrice": 10.0,
  //     "offerPrice": 8.0,
  //     "unit": "Kg",
  //   },
  // ];
  final qController = TextEditingController();


  final pName = TextEditingController();
  final pCategory = TextEditingController();
  final pSCategory1 = TextEditingController();
  final pSCategory2 = TextEditingController();
  final description = TextEditingController();

  Future<void> stockUpdate() async{
    final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products/$pid';

    // final itemOptions = quantityPricing;

    final Map<String, dynamic> productJson = {
      "inStock": _switchValue
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${TokenId.token}'
        },
        body: jsonEncode(productJson),
      );

      if (response.statusCode == 200) {
        print("product updated succesfully");

      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
    }
  }


  @override
  Widget build(BuildContext context) {
    dummyProductList = widget.quantityPricing;
    print("dummyProductList1234");
    print(dummyProductList);
    print(widget.pid);
    print("pid");

    var data = dummyProductList.length;
    print(data);

    String token = widget.token;
    String id = widget.id;
    pName.text = widget.productName;
    print(pName.text);
    print("pName.text");

    pCategory.text = widget.productCategory;

    pSCategory1.text = widget.productSubCategory1;

    pSCategory2.text = widget.productSubCategory2;

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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CupertinoSwitch(
                                  activeColor: Colors.red,
                                  value: _switchValue,
                                  onChanged: (bool value) {
                                      s = value == false ? 'In stock' : 'Out of stock';
                                      _switchValue = value;
                                    updateStock(value);
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
                            margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Product Image:",textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold)),

                                Container(
                                  height: 150,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: GridView.builder(
                                  //         scrollDirection: Axis.horizontal,
                                  //         itemCount: widget.imageFileList!.length,
                                  //         gridDelegate:
                                  //         SliverGridDelegateWithFixedCrossAxisCount(
                                  //             crossAxisCount: 1,
                                  //             mainAxisSpacing: 5),
                                  //         itemBuilder:
                                  //             (BuildContext context, int index) {
                                  //           return Image.file(
                                  //             File(widget.imageFileList![index].path),
                                  //             fit: BoxFit.cover,
                                  //           );
                                  //         }),
                                  //   ),
                                ),
                              ],
                            )),
                        InkWell(
                          onTap: () {
                            saveProductData(pName, pSCategory2, description, token,id, widget.pid, dummyProductList, false);
                            Navigator.push(

                              context,
                              MaterialPageRoute(
                                builder: (context) => Category(
                                  productName: pName.text,
                                  productDescription: description.text,
                                  update:true, stockIO: widget.stockIO, stockTF: widget.stockTF,
                                    dummyProductList: dummyProductList,
                                  pid:widget.pid, itemOptions: [],
                                ), //changed
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Text(
                              'Choose Category >',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
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
                            'SubCategory1',
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
                            controller: pSCategory1,
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
                            'SubCategory2',
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
                            controller: pSCategory2,
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
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
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
                          margin: EdgeInsets.only(left: 20,right: 20,top: 25),
                          child: Text(
                            'Product Quantity/Price',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          height: 188.0*(data),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dummyProductList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final product = dummyProductList[index];
                              // final productUnit = product["unit"];
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20,right: 20 ),
                                    child: Text(
                                      'Variant ${(index+1).toString()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15),
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
                                                  TextEditingController(text: product.quantity),
                                                  // onChanged: (value) => option.quantity = value,
                                                  onChanged: (value){
                                                    itemOptions[index].quantity = value;
                                                  },
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
                                                value: product.unit,
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    product.unit  = value!;
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
                                                  TextEditingController(text: product.mrpPrice.toString()),
                                                  onChanged: (value){
                                                    itemOptions[index].price = value;
                                                  },
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
                                                  controller:
                                                  TextEditingController(text: product.offerPrice.toString()),
                                                  onChanged: (value){
                                                    itemOptions[index].offerPrice = value;
                                                  },
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
                                ],
                              );
                            },
                          ),
                        ),

                        PriceQuantitySpinnerRow(
                            options: itemOptions,
                            onOptionAdded: handleOptionAdded,
                            updateInitialValue:
                                (pControllers, oController, qController) {
                            }),


                        Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
                          child: ElevatedButton(
                            onPressed: (){
                              saveProductData(pName, pSCategory2, description, token,id, widget.pid, dummyProductList, true);

                          },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue, // Set the background color to white
                            ),
                            child: const Text('Save And Update',style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                          color: Colors.lightBlue.shade500,
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

//update Stock only
  Future<void> updateStock(bool value) async {
    print(value);
    print("value");
    print(widget.pid);
    final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products/${widget.pid}';

    final Map<String, dynamic> productJson ;
    if (value==true)
      productJson = {"inStock":"true"}; else productJson = {"inStock":"false"};
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${TokenId.token}'
        },
        body: jsonEncode(productJson),
      );

      if (response.statusCode == 200) {
        print("product updated succesfully");

      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    setState(() {

    });
  }

  Future<void> saveProductData(TextEditingController pName, TextEditingController pSCategory2,
      TextEditingController description,String token, String id, String pid, dummyProductList, toSave) async{

    print("dummyProductList");
    itemOptions.forEach((itemOption) {
      dummyProductList.add(QuantityPricing(offerPrice: int.parse(itemOption.offerPrice),
          quantity: itemOption.price, mrpPrice: double.parse(itemOption.quantity), unit: itemOption.unit));
    });
    itemOptions=[];
    print(dummyProductList.length);
    if(toSave)
    {
      print("updatinggggg");
      await UserApi.updateProduct(pName.text, pCategory.text, pSCategory2.text,
          pSCategory2.text, description.text, token, id, pid, dummyProductList);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainDashboard(token: token, id: id)));
    }
  }
}
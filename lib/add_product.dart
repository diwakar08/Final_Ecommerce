import 'dart:io';

import 'package:e_commerce/review_listed.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'categoryList.dart';
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
                                errorText:
                                _validate4 ? 'Value Can\'t Be Empty' : null,
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
                                errorText:
                                _validate5 ? 'Value Can\'t Be Empty' : null,
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
                                errorText:
                                _validate6 ? 'Value Can\'t Be Empty' : null,
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
            child: ElevatedButton(
              onPressed: addOption,
              child: Text("Add items"),
            )),
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

class AddProduct extends StatefulWidget {
  final String productName;
  final String productDescription;
  String token, id;
  String category = '';
  String subCategory1 = '';
  String subCategory2 = '';
  final List productDetails;
  final List<ItemOption> itemOptions;
  AddProduct(
      {Key? key,
        required this.token,
        required this.id,
        required this.category,
        required this.subCategory1,
        required this.subCategory2,
        required this.productName,
        required this.productDescription,
        required this.productDetails, required this.itemOptions})
      : super(key: key);

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

  bool _validate1 = false;
  bool _validate2 = false;

  String productType = 'Veg';
  TextEditingController productTypeContt = TextEditingController();
  TextEditingController productNameContt = TextEditingController();
  TextEditingController productDescriptionContt = TextEditingController();
  void valueUpdate(String pname, String desc) {
    productNameContt.text = pname;
    productDescriptionContt.text = desc;
    productDescriptionContt.text=widget.productDescription;
    productNameContt.text=widget.productName;
    setState(() {
      itemOptions=widget.itemOptions;
    });
  }

  @override
  void initState() {
    valueUpdate(widget.productName, widget.productDescription);
  }

  @override
  Widget build(BuildContext context) {
    var items2 = [
      'Veg',
      'Non Veg',
      'Not required',
    ];

    String productName = widget.productName;
    String productDescription = widget.productDescription;
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
            // Expanded(
            //     child: Icon(
            //       Icons.add_circle_outline,
            //       color: Colors.white,
            //     )),
            CircleAvatar(
              backgroundColor: Colors.red.shade100,
              backgroundImage: AssetImage('assets/images/a1.png'),
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
                      InkWell(
                        onTap: () {
                          // updateDummyList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Category(
                                productName: productNameContt.text,
                                productDescription: productDescriptionContt.text,
                                update:false, stockIO: '', stockTF: false, itemOptions: itemOptions, pid: '', dummyProductList: [],
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
                          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Category:",
                                  textScaleFactor: 1.0,
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.category, textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product SubCategory1:",
                                  textScaleFactor: 1.0,
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.subCategory1, textScaleFactor: 1.5),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product SubCategory2:",
                                  textScaleFactor: 1.0,
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.subCategory2, textScaleFactor: 1.5),
                            ],
                          )),
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
                          controller: productNameContt,
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                          decoration: InputDecoration(
                            errorText:
                            _validate1 ? 'Value Can\'t Be Empty' : null,
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
                          controller: productDescriptionContt,
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                          decoration: InputDecoration(
                            errorText:
                            _validate2 ? 'Value Can\'t Be Empty' : null,
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
                          'Select Quantity/price',
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
                              (pControllers, oController, qController) {}),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, bottom: 40, top: 20),
                        child: MaterialButton(
                          onPressed: () {
                            if (productName.isEmpty ||
                                productDescription.isEmpty) {
                              setState(() {
                                productName.isEmpty
                                    ? _validate1 = true
                                    : _validate1 = false;
                                productDescription.isEmpty
                                    ? _validate2 = true
                                    : _validate1 = false;
                              });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewListed(
                                      token: widget.token,
                                      id: widget.id,
                                      itemOptions: itemOptions,
                                      productName: productName,
                                      imageFileList: imageFileList,
                                      productType: productType,
                                      description: productDescription,
                                      category: widget.category,
                                      subCategory1: widget.subCategory1,
                                      subCategory2: widget.subCategory2,
                                    ),
                                  ));
                            }
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
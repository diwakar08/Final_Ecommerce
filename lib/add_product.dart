import 'dart:io';

import 'package:e_commerce/review_listed.dart';
import 'package:e_commerce/services/category_api.dart';
import 'package:e_commerce/services/tokenId.dart';
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
    "other",
  ];

  bool _validate4 = false;
  bool _validate5 = false;
  bool _validate6 = false;

  @override
  void initstate() {
    super.initState();
    widget.onOptionAdded(newItem);
  }

  void addOption() {
    widget.onOptionAdded(newItem);
    newItem = ItemOption(
      price: '',
      quantity: '',
      unit: 'kg',
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller:
                                TextEditingController(text: option.quantity),
                            onChanged: (value) => option.quantity = value,
                            decoration: InputDecoration(
                              hintText: 'Quantity',
                              label: const Text('Quantity'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller:
                                TextEditingController(text: option.price),
                            onChanged: (value) => option.price = value,
                            decoration: InputDecoration(
                              hintText: 'Price (In Rs.)',
                              label: const Text('Price (In Rs.)'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
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
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller:
                                TextEditingController(text: option.offerPrice),
                            onChanged: (value) => option.offerPrice = value,
                            decoration: InputDecoration(
                              hintText: 'Offer Price',
                              label: const Text('Offer Price'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
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
  final List productDetails;
  final List<ItemOption> itemOptions;
  AddProduct(
      {Key? key,
      required this.token,
      required this.id,
      required this.productName,
      required this.productDescription,
      required this.productDetails,
      required this.itemOptions})
      : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String category = "";
  String subCategory = "";
  String subCategory1 = "";
  List<ItemOption> itemOptions = [];
  TextEditingController productDescriptionController = TextEditingController();
  PageController pageController = PageController();

  void handleOptionAdded(ItemOption newItem) {
    setState(() {
      itemOptions.add(newItem);
    });
  }

  final AllpCategory = TextEditingController();
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
  final _formkey = GlobalKey<FormState>();
  String productCategoryType = 'Food';
  TextEditingController productTypeContt = TextEditingController();
  TextEditingController productNameContt = TextEditingController();
  TextEditingController productDescriptionContt = TextEditingController();
  void valueUpdate(String pname, String desc) {
    productNameContt.text = pname;
    productDescriptionContt.text = desc;
    productDescriptionContt.text = widget.productDescription;
    productNameContt.text = widget.productName;
    setState(() {
      itemOptions = widget.itemOptions;
    });
  }

  FocusNode descriptionFocusNode = FocusNode();

// Initialize the FocusNode in your build method or constructor.

  void showCameraImageExpansion(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Expanded Image'),
            ),
            body: Center(
              child: Hero(
                  tag: 'image_$index',
                  child: Image.file(
                    File(imageFileList![index].path),
                    fit: BoxFit.cover,
                  )),
            ),
          );
        },
      ),
    );
  }

  Future<void> showCameraDeleteConfirmationDialog(int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Image?'),
          content: Text('Are you sure you want to delete this image?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                removeCameraImage(index); // Remove the image from the list
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void removeCameraImage(int index) {
    setState(() {
      imageFileList!.removeAt(index);
    });
  }

  Widget PageDialog() {
    return AlertDialog(
      content: PageView(controller: pageController, children: [
        categoryDialog(),
        Text("Page 2"),
        Text("Page 3"),
      ]),
    );
  }

  Widget categoryDialog() {
    return FutureBuilder(
      future: getCategory(TokenId.token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error : ${snapshot.error}"),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.data[0].category.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    category = snapshot.data!.data[0].category[index];
                  });
                  Navigator.pop(context);
                },
                leading: CircleAvatar(),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(snapshot.data!.data[0].category[index]),
              );
            },
          );
        }
      },
    );
  }

  Widget subCategoryDialog() {
    return Dialog(
      child: FutureBuilder(
        future: getSubCategory(TokenId.token, category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data[0].subCategory1.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      subCategory = snapshot.data!.data[0].subCategory1[index];
                    });
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(snapshot.data!.data[0].subCategory1[index]),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget subCategory2Dialog() {
    return Dialog(
      child: FutureBuilder(
        future: getSubCategory2(TokenId.token, category, subCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      subCategory1 = snapshot.data!.data[index];
                    });
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(snapshot.data!.data[index]),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    valueUpdate(widget.productName, widget.productDescription);
    itemOptions.add(ItemOption(
      price: '',
      quantity: '',
      unit: 'kg',
      offerPrice: '',
    ));
  }

  @override
  Widget build(BuildContext context) {
    var items2 = [
      'Veg',
      'Non Veg',
      'Not required',
    ];
    descriptionFocusNode.addListener(() {
      if (!descriptionFocusNode.hasFocus) {
        setState(() {
          _validate2 = productDescriptionContt.text.isEmpty;
        });
      }
    });
    AllpCategory.text = category + ' / ' + subCategory + ' / ' + subCategory1;
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
                      // Container(
                      //   margin: EdgeInsets.only(right: 10, left: 15, top: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         child: Text(
                      //           'Add Product',
                      //           style: TextStyle(
                      //               fontSize: 28,
                      //               fontFamily: 'Poppins',
                      //               color: Colors.black87,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 20, top: 5),
                        child: Text(
                          'Fill your product details correctly',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 25),
                            child: Text(
                              'Product Category:',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          category == "" || category.isEmpty
                              ? Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        // barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Choose Category'),
                                            content: categoryDialog(),
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Choose Category'),
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(category),
                                ),
                        ],
                      ),
                      category.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 25),
                                  child: Text(
                                    'Product Subcategory 1:',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                subCategory == "" || subCategory.isEmpty
                                    ? Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return subCategoryDialog();
                                              },
                                            );
                                          },
                                          child: const Text(
                                              'Choose SubCategory 1'),
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(subCategory),
                                      ),
                              ],
                            )
                          : Container(),
                      subCategory.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 25),
                                  child: Text(
                                    'Product Subcategory 2:',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                subCategory1 == "" || subCategory1.isEmpty
                                    ? Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return subCategory2Dialog();
                                              },
                                            );
                                          },
                                          child: const Text(
                                              'Choose SubCategory 2'),
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(subCategory),
                                      ),
                              ],
                            )
                          : Container(),
                      // DropdownButton(items: , onChanged: onChanged),
                      // widget.category == "" ||
                      //         widget.subCategory1 == "" ||
                      //         widget.subCategory2 == ""
                      //     ? Container()
                      //     : Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Container(
                      //               margin: EdgeInsets.only(
                      //                   left: 20, right: 20, top: 15),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text("Product Category:",
                      //                       textScaleFactor: 1.0,
                      //                       style: TextStyle(
                      //                           fontWeight: FontWeight.bold)),
                      //                   Text(widget.category,
                      //                       textScaleFactor: 1.5),
                      //                 ],
                      //               )),
                      //           Container(
                      //               margin: EdgeInsets.only(
                      //                   left: 20, right: 20, top: 15),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text("Product SubCategory1:",
                      //                       textScaleFactor: 1.0,
                      //                       style: TextStyle(
                      //                           fontWeight: FontWeight.bold)),
                      //                   Text(widget.subCategory1,
                      //                       textScaleFactor: 1.5),
                      //                 ],
                      //               )),
                      //           Container(
                      //               margin: EdgeInsets.only(
                      //                   left: 20, right: 20, top: 15),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text("Product SubCategory2:",
                      //                       textScaleFactor: 1.0,
                      //                       style: TextStyle(
                      //                           fontWeight: FontWeight.bold)),
                      //                   Text(widget.subCategory2,
                      //                       textScaleFactor: 1.5),
                      //                 ],
                      //               )),
                      //         ],
                      //       ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: AllpCategory,
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal.shade900)),
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
                                      return Stack(
                                        children: [
                                          Hero(
                                            tag: 'image_$index',
                                            child: GestureDetector(
                                                onTap: () {
                                                  showCameraImageExpansion(
                                                      index);
                                                },
                                                child: Image.file(
                                                  File(imageFileList![index]
                                                      .path),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.cyanAccent,
                                              ),
                                              onPressed: () {
                                                showCameraDeleteConfirmationDialog(
                                                    index);
                                                // removeImage(index);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // widget.category == "Food" ||
                      //         widget.subCategory1 == "Dairy" ||
                      //         widget.subCategory1 == "Bread & Eggs"
                      // ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 25),
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
                        ],
                      ),
                      Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align everything to the left
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextFormField(
                                  controller:
                                      productNameContt, // Use the controller
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 16),
                                  decoration: InputDecoration(
                                    hintText: 'Write the productName',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade900),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Value can\'t be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 25),
                                child: Text(
                                  'Product  Description',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextFormField(
                                  controller:
                                      productDescriptionController, // Use the controller
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 16),
                                  decoration: InputDecoration(
                                    hintText: 'Optional Field',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal.shade900),
                                    ),
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Value can\'t be empty';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 25),
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
                                    (pControllers, oController, qController) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                height: 45,
                                // color: Colors.blue,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReviewListed(
                                              token: widget.token,
                                              id: widget.id,
                                              itemOptions: itemOptions,
                                              productName:
                                                  productNameContt.text,
                                              imageFileList: imageFileList,
                                              productType: productType,
                                              description:
                                                  productDescriptionController
                                                      .text,
                                              category: category,
                                              subCategory1: subCategory,
                                              subCategory2: subCategory1,
                                            ),
                                          ));
                                    }

                                    // Process the form data and perform submission
                                    // You can access the entered data using the controllers
                                  },
                                  child: const Text(
                                    'Submit',
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                              )
                            ],
                          ),
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

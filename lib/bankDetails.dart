import 'package:e_commerce/services/User_api.dart';
import 'package:e_commerce/uploadmages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
// import 'package:flutter_project/uploadImages.dart';

import 'apis/sellerModel.dart';
// import 'date_selector.dart';
import 'package:intl/intl.dart';

import 'main_dashboard.dart';


void main() {
  runApp(BankDetailsApp());
}

class BankDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: BankDetailsForm( token: '', id: '',),//seller: UpdateSeller(),
    );
  }
}

class BankDetailsForm extends StatefulWidget {
  // late UpdateSeller seller;
  String token, id;
  BankDetailsForm({ required this.token, required this.id});
  @override
  _BankDetailsFormState createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<BankDetailsForm> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController fssaiController = TextEditingController();
  final TextEditingController fssaiExpiryController = TextEditingController();
  final TextEditingController shopActController = TextEditingController();
  final TextEditingController shopActExpiryController = TextEditingController();


  Future<void> postPersonalDetails() async {
    print("printing cc no");
    Map<String, dynamic> updatedFields = {
      "accountNo": bankAccountController.text,
      "ifscCode":ifscController.text,
      "panNo":panController.text,
      "gstNumber":gstController.text,
      "fssaiLicenseNumber":fssaiController.text,
      "shopActLicenseNumber":shopActController.text,
      "shopActLicenseExpiryDate":shopActExpiryController.text,


    };
    // await UserApi.updateSeller(widget.token, widget.id, updatedFields);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UploadImages( token: widget.token, id: widget.id,)));
  }

  DateTime selectedDate = DateTime(2020);
  DateTime selectedDate1 = DateTime(2020);
  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != DateTime.now())
  //     print('Selected date: $picked');
  // }

  Color customColor = const Color(0xFFDEDC07);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Personal Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            border: Border.all(
                              color: Colors.cyanAccent,
                              width: 2.0, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('1',
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: Colors.cyanAccent,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            border: Border.all(
                              color: Colors.cyanAccent,
                              width: 2.0, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('2',
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 90,
                        decoration: BoxDecoration(
                          color: customColor,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            color: customColor,
                            border: Border.all(
                              color: customColor,
                              width: 2.0, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('3',
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),

                Row(
                  children: [
                    const Text(
                        'Bank Account Details', style: TextStyle(fontSize: 18)),
                    const Text('*',style: TextStyle(fontSize: 18,color: Colors.red),)
                  ],
                ),
                TextFormField(
                  controller: bankAccountController,
                  decoration: const InputDecoration(
                    // labelText: 'Bank Account Number',
                    hintText: 'Enter bank account number',
                  ),
                  onChanged: (value){
                    setState(() {
                      _formkey.currentState?.validate();
                    });
                  },

                  validator: (value){
                    if(value!.isEmpty || value.length < 2){
                      return 'Please enter bank account number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: ifscController,
                  decoration: const InputDecoration(
                    // labelText: 'IFSC Code',
                    hintText: 'Enter IFSC code',
                  ),
                  onChanged: (value){
                    setState(() {
                      _formkey.currentState?.validate();
                    });
                  },

                  validator: (value){
                    if(value!.isEmpty || value.length < 2){
                      return 'Please enter IFSC code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    Text('PAN Card Number', style: TextStyle(fontSize: 18)),
                    const Text('*',style: TextStyle(fontSize: 18,color: Colors.red),)
                  ],
                ),
                TextFormField(
                  controller: panController,
                  decoration: const InputDecoration(
                    // labelText: 'PAN Card Number',
                    hintText: 'Enter PAN card number',
                  ),
                  onChanged: (value){
                    setState(() {
                      _formkey.currentState?.validate();
                    });
                  },

                  validator: (value){
                    if(value!.isEmpty || value.length < 2){
                      return 'Please enter PAN card number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                Row(
                  children: [
                    const Text(
                        'GST Number/FSSAI License', style: TextStyle(fontSize: 18)),
                    const Text('*',style: TextStyle(fontSize: 18,color: Colors.red),)
                  ],
                ),
                TextFormField(
                  controller: gstController,
                  decoration: const InputDecoration(
                    // labelText: 'GST Number (Optional)',
                    hintText: 'Enter GST number (if applicable)',
                  ),
                  onChanged: (value){
                    setState(() {
                      _formkey.currentState?.validate();
                    });
                  },

                  validator: (value){
                    if(value!.isEmpty || value.length < 2){
                      return 'Please enter GST number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: fssaiController,
                  decoration: const InputDecoration(
                    // labelText: 'FSSAI License (Optional)',
                    hintText: 'Enter FSSAI license number (if applicable)',
                  ),
                  onChanged: (value){
                    setState(() {
                      _formkey.currentState?.validate();
                    });
                  },

                  validator: (value){
                    if(value!.isEmpty || value.length < 2){
                      return 'Please enter FSSAI license number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),


                TextFormField(
                  readOnly: true,
                  controller: fssaiExpiryController,
                  decoration: const InputDecoration(
                    // labelText: 'FSSAI License Expiry Date',
                    hintText: 'Enter FSSAI license Expiry Date',
                  ),

                  onTap: () async {
                    var datePicked = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2090),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,

                    );

                    if (datePicked != null && datePicked != selectedDate) {
                      setState(() {
                        selectedDate = datePicked;
                      });
                    }


                    String input = DateFormat('dd-MMM-yyyy').format(datePicked!);



                    fssaiExpiryController.text = (input);
                    final snackBar =
                    SnackBar(content: Text("Date Picked $datePicked"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },

                ),

                // ElevatedButton(onPressed: () { date_picker();},
                //   child: Text(
                //     'FSSAI License Expiry Date',
                //     style: TextStyle(color: Colors.blue, fontSize: 20.0),
                //   ),
                // ),

                // ElevatedButton(
                //   child: Text("open picker dialog"),
                //   onPressed: () async {
                //     var datePicked = await DatePicker.showSimpleDatePicker(
                //       context,
                //       initialDate: DateTime(2020),
                //       firstDate: DateTime(2020),
                //       lastDate: DateTime(2090),
                //       dateFormat: "dd-MMMM-yyyy",
                //       locale: DateTimePickerLocale.en_us,
                //       looping: true,
                //     );
                //
                //     final snackBar =
                //     SnackBar(content: Text("Date Picked $datePicked"));
                //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //   },
                // ),

                SizedBox(height: 30,),

                Row(
                  children: [
                    const Text(
                        'Shop Act License Number', style: TextStyle(fontSize: 18)),
                    const Text('*',style: TextStyle(fontSize: 18,color: Colors.red),)
                  ],
                ),
                TextFormField(
                  controller: shopActController,
                  decoration: const InputDecoration(
                    // labelText: 'Shop Act License Number(Optional)',
                    hintText: 'Enter Shop Act license Number',
                  ),
                  onChanged: (value){
                    setState(() {
                      _formkey.currentState?.validate();
                    });
                  },

                  validator: (value){
                    if(value!.isEmpty || value.length < 2){
                      return 'Please enter Shop Act License Number';
                    }
                    return null;
                  },
                ),


                // TextFormField(
                //   controller: shopActExpiryController,
                //   decoration: const InputDecoration(
                //     labelText: 'Shop Act License Expiry Date',
                //     hintText: 'Enter Shop Act license Expiry Date',
                //   ),
                // ),
                TextFormField(
                  readOnly: true,
                  controller: shopActExpiryController,
                  decoration: const InputDecoration(
                    labelText: 'Shop Act License Expiry Date',
                    hintText: 'Enter Shop Act license Expiry Date',
                  ),
                  onTap: () async {

                    var datePicked1 = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: selectedDate1,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2090),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );


                    if (datePicked1 != null && datePicked1 != selectedDate1) {
                      setState(() {
                        selectedDate1 = datePicked1;
                      });

                    }


                    String input1 = DateFormat('dd-MMM-yyyy').format(datePicked1!);



                    shopActExpiryController.text = (input1);
                    final snackBar =
                    SnackBar(content: Text("Date Picked $datePicked1"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },


                ),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate() || true){
                          print('success');
                          postPersonalDetails();
                        }

                        // Process the form data and perform submission
                        // You can access the entered data using the controllers
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
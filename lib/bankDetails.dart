import 'package:e_commerce/services/User_api.dart';
import 'package:e_commerce/uploadmages.dart';
import 'package:flutter/material.dart';

import 'apis/sellerModel.dart';
import 'main_dashboard.dart';

void main() {
  runApp(BankDetailsApp() as Widget);
}

class BankDetailsApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: BankDetailsForm(seller: UpdateSeller(), token: '', id: '',),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class BankDetailsForm extends StatefulWidget {
  late UpdateSeller seller;
 final String token, id;
  BankDetailsForm({required this.seller, required this.token, required this.id});
  @override
  _BankDetailsFormState createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<BankDetailsForm> {
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController fssaiController = TextEditingController();
  final TextEditingController fssaiExpiryController = TextEditingController();
  final TextEditingController shopActController = TextEditingController(); //are not sending
  final TextEditingController shopActExpiryController = TextEditingController();//are not sending to backend
  late UpdateSeller seller = widget.seller;

  Future<void> postPersonalDetails() async {
    seller.accountNo = bankAccountController.text;
    seller.ifscCode = ifscController.text;
    seller.panNo = panController.text;
    seller.gstNumber = gstController.text;
    seller.fssaiLicenseNumber = fssaiController.text;
    Map<String, dynamic> updatedFields = {
      "accountNo": seller.accountNo,
      "ifscCode":seller.ifscCode,
      "panNo":seller.panNo,
      "gstNumber":seller.gstNumber,
      "fssaiLicenseNumber":seller.fssaiLicenseNumber

    };
    await UserApi.updateSeller(widget.token, widget.id, updatedFields);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainDashboard(token:widget.token, id:widget.id)));


    // print("printing cc no");
    // print(seller.accountNo);
    // print(seller.shopName);
    // Navigator.push(context,
        // MaterialPageRoute(builder: (context) => UploadImages(seller: seller)));
  }


  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now())
      print('Selected date: $picked');
  }

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
                      width: 120,
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
                      width: 120,
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
              const Text(
                  'Bank Account Details', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: bankAccountController,
                decoration: const InputDecoration(
                  labelText: 'Bank Account Number',
                  hintText: 'Enter bank account number',
                ),
              ),
              TextFormField(
                controller: ifscController,
                decoration: const InputDecoration(
                  labelText: 'IFSC Code',
                  hintText: 'Enter IFSC code',
                ),
              ),
              const SizedBox(height: 30),
              Text('PAN Card Number', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: panController,
                decoration: const InputDecoration(
                  labelText: 'PAN Card Number',
                  hintText: 'Enter PAN card number',
                ),
              ),
              SizedBox(height: 30),
              const Text(
                  'GST Number/FSSAI License', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: gstController,
                decoration: const InputDecoration(
                  labelText: 'GST Number (Optional)',
                  hintText: 'Enter GST number (if applicable)',
                ),
              ),
              TextFormField(
                controller: fssaiController,
                decoration: const InputDecoration(
                  labelText: 'FSSAI License (Optional)',
                  hintText: 'Enter FSSAI license number (if applicable)',
                ),
              ),


              // TextFormField(
              //   controller: fssaiExpiryController,
              //   decoration: const InputDecoration(
              //     labelText: 'FSSAI License Expiry Date',
              //     hintText: 'Enter FSSAI license Expiry Date',
              //   ),
              //   onTap: ()=> _selectDate(context),
              //      Text(
              //       'Select Date',
              //       style: TextStyle(color: Colors.blue, fontSize: 20.0),
              //     ),
              // ),

              ElevatedButton(onPressed: () => _selectDate(context),
                child: Text(
                  'FSSAI License Expiry Date',
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
              ),
              SizedBox(height: 30,),
              const Text(
                  'Shop Act License Number', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: shopActController,
                decoration: const InputDecoration(
                  labelText: 'Shop Act License Number(Optional)',
                  hintText: 'Enter Shop Act license Number',
                ),
              ),


              TextFormField(
                controller: shopActExpiryController,
                decoration: const InputDecoration(
                  labelText: 'Shop Act License Expiry Date',
                  hintText: 'Enter Shop Act license Expiry Date',
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      postPersonalDetails();
                      // Process the form data and perform submission
                      // You can access the entered data using the controllers
                    },
                    child: const Text('Submit'),
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
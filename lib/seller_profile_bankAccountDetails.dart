import 'dart:convert';

import 'package:e_commerce/services/sellerApi.dart';
import 'package:e_commerce/services/sellerTokenId.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_project/apis/sellerProfile.dart';
// import 'package:flutter_project/registeration.dart';
import 'package:e_commerce/services/User_api.dart';
// import 'package:flutter_project/services/sellerApi.dart';
// import 'package:flutter_project/services/sellerTokenId.dart';
import 'package:http/http.dart' as http;
import 'apis/Seller.dart';
import 'apis/sellerProfile.dart';

class BankAccountDetails extends StatefulWidget {
  const BankAccountDetails({super.key});
  // final String title;

  @override
  State<BankAccountDetails> createState() => _BankAccountDetailsState();
}

class _BankAccountDetailsState extends State<BankAccountDetails> {
  var Bank_Account_Controller = TextEditingController();
  var Bank_IFSC_Controller = TextEditingController();
  var Pan_Card_Controller = TextEditingController();

  String sellerId = Candidate().id;
  String sellerToken = Candidate().token;
  late SellerProfile seller;

  @override
  initState() {
    fetchSeller();
  }

  Future<void> fetchSeller() async {
    seller = await SellerApi().getSellerProfile(sellerToken, sellerId);
    Bank_Account_Controller.text = seller.data.bankDetails.accountNo;
    Bank_IFSC_Controller.text = seller.data.bankDetails.ifscCode;
    Pan_Card_Controller.text = seller.data.panCard.panNo;
  }

  Future<void> postBankDetails() async {
    Map<String, dynamic> json = {
      "accountNo": Bank_Account_Controller.text,
      "ifscCode": Bank_IFSC_Controller.text,
      "panNo": Pan_Card_Controller.text,
    };
    final response =
    await SellerApi().updateBankDetails(json, sellerId, sellerToken);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Bank Account Details Updated")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Edit Bank Details"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 140,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/images/a1.jpg'),
                        ),
                        Text("Cancelled Cheque Image")
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                        controller: Bank_Account_Controller,
                        decoration: InputDecoration(
                          labelText: 'Bank Account Number',
                          hintText: 'Enter your Account number',
                          prefixIcon: const Icon(Icons.account_balance),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter Bank Account Number';
                          } else if (value.length > 10) {
                            return "Bank Account Number must be greater than 10 digit long";
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: Bank_IFSC_Controller,
                      // validator: (value) {
                      //   if(value!.length<5) {
                      //     return "username length must be 5";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      decoration: InputDecoration(
                        labelText: 'IFSC Code',
                        hintText: '  Enter IFSC Code',
                        prefixIcon: Icon(Icons.account_balance),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: Pan_Card_Controller,
                      // validator: (value) {
                      //   if(value!.length<5) {
                      //     return "username length must be 5";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      decoration: InputDecoration(
                        labelText: 'PAN Card Number',
                        hintText: '  Enter PAN Card Number',
                        prefixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //     height: 20
                  // ),

                  SizedBox(height: 60),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: postBankDetails,
                      child: Text('Save Bank Details'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
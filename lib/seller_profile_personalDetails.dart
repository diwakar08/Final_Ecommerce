import 'dart:convert';

import 'package:e_commerce/services/sellerApi.dart';
import 'package:e_commerce/services/sellerTokenId.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_project/apis/sellerProfile.dart';
import 'package:e_commerce/services/User_api.dart';
// import 'package:flutter_project/services/sellerApi.dart';
// import 'package:flutter_project/services/sellerTokenId.dart';
import 'package:http/http.dart' as http;
import 'apis/Seller.dart';
import 'apis/sellerProfile.dart';

class SellerProfilePersonalDetails extends StatefulWidget {
  const SellerProfilePersonalDetails({super.key});
  // final String title;

  @override
  State<SellerProfilePersonalDetails> createState() =>
      _SellerProfilePersonalDetailsState();
}

class _SellerProfilePersonalDetailsState
    extends State<SellerProfilePersonalDetails> {
  late SellerProfile seller;
  String sellerId = Candidate().id;
  String sellerToken = Candidate().token;

  @override
  initState() {
    fetchSeller();
  }

  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  Future<void> fetchSeller() async {
    seller = await SellerApi().getSellerProfile(sellerToken, sellerId);
    nameController.text = seller.data.ownerName;
    phoneController.text = seller.data.phone;
    print("phone");
  }

  Future<void> postPersonalDetails() async {
    Map<String, dynamic> json = {
      "ownerName": nameController.text,
      "phone": phoneController.text,
    };
    final response =
    await SellerApi().updateProfile(json, sellerId, sellerToken);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Profile Updated")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Edit profile page"),
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
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/a1.jpg'),
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
                      controller: nameController,
                      validator: (value) {
                        if (value!.length < 5) {
                          return "username length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'username',
                        hintText: '  enter username',
                        prefixIcon: Icon(Icons.person),
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
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter your mobile number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a mobile number';
                          } else if (value.length != 10) {
                            return "number must be 10 digit long";
                          }
                          return null;
                        }),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: postPersonalDetails,
                      child: Text('Save Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
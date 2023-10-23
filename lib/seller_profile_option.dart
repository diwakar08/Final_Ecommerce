
import 'package:e_commerce/seller_profile_bankAccountDetails.dart';
import 'package:e_commerce/seller_profile_personalDetails.dart';
import 'package:e_commerce/seller_profile_shopDetails.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_project/seller_profile_personalDetails.dart';
// import 'package:flutter_project/seller_profile_bankAccountDetails.dart';
// import 'package:flutter_project/seller_profile_shopDetails.dart';

class profileOptions extends StatelessWidget {
  const profileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Profile Page',
            )),
        backgroundColor: Color(0xFF08FFC8),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 290,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellerProfilePersonalDetails()),
                  );
                },
                child: Wrap(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.black38,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Personal Details",
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFF204969))),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Color(0xFF204969),
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 290,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellerProfileShopDetails()),
                  );
                },
                child: Wrap(
                  children: <Widget>[
                    Icon(
                      Icons.store,
                      color: Colors.black38,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Shop Details",
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFF204969))),
                    SizedBox(
                      width: 70,
                    ),
                    Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Color(0xFF204969),
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 290,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BankAccountDetails()),
                  );
                },
                child: Wrap(
                  children: <Widget>[
                    Icon(
                      Icons.account_balance,
                      color: Colors.black38,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Bank Account Details",
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFF204969))),
                    // SizedBox(
                    //   width:1,
                    // ),
                    Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Color(0xFF204969),
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
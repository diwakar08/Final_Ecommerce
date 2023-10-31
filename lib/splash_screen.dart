// import 'package:e_commerce/app/screens/user_login_screen/userLoginScreen.dart';
import 'package:e_commerce/seller_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isRememberMe = false;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration:
                // BoxDecoration(
                //   color: Colors.white
                // ),

                BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x66FFA500),
                          Color(0x99FFA500),
                          Color(0xccFFA500),
                          Color(0xffFFA500),
                        ])),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 60,
                    width: 180,
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
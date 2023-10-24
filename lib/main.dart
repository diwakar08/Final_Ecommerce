// import 'package:e_commerce/home.dart';
import 'package:e_commerce/seller_dashboard.dart';
import 'package:e_commerce/seller_login.dart';
import 'package:flutter/material.dart';
// import 'dart:ui_web' show debugEmulateFlutterTesterEnvironment;

void main() {
  // debugEmulateFlutterTesterEnvironment = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

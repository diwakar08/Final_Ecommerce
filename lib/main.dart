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
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    bool forAndroid=false;
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),

      ),
      body: Switch(
        // thumb color (round icon)
        activeColor: Colors.amber,
        activeTrackColor: Colors.cyan,
        inactiveThumbColor: Colors.blueGrey.shade600,
        inactiveTrackColor: Colors.grey.shade400,
        splashRadius: 50.0,
        // boolean variable value
        value: forAndroid,
        // changes the state of the switch
        onChanged: (value) => setState(() => forAndroid = value),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

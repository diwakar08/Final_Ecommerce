import 'package:flutter/material.dart';


class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Category Codes List'),
        ),
        body: CategoryList(),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<String> categoryCodes = [
    "APPAREL001",
    "ELECTRONICS002",
    "FOOD003",
    "AUTO_PARTS101",
    "CAR_ACCESSORIES102",
    "TIRES103",
    "EDU_MATH201",
    "EDU_HISTORY202",
    "EDU_SCIENCE203",
    "HEALTH_DENTAL301",
    "HEALTH_PSYCHIATRY302",
    "HEALTH_PHYSIOTHERAPY303",
    "TECH_SOFTWARE401",
    "TECH_HARDWARE402",
    "TECH_NETWORKING403",
    // Add more category codes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryCodes.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Category(),));
          },
          title: Text(categoryCodes[index]),
        );
      },
    );
  }
}

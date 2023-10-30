import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_commerce/services/tokenId.dart';

class Categories {

  static List<String> categories = [],
      subCategories = [];

  static Future<void> getAllCategory() async {
    final apiUrl = "https://api.pehchankidukan.com/seller/category";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${TokenId.token}',
      },
    );

    // if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
    print(jsonData);
      categories = jsonData["data"][0]["category"];
      print("cattt");
      print(categories);
    // }
  }
}
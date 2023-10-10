
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import '../apis/ProductModel.dart';
import '../apis/Seller.dart';
import '../apis/orderModel.dart';
import 'package:http/http.dart' as http;

class UserApi {


  //search
  Future<List<Product>> searchProducts(String keyword, token, id) async {
    final Url = 'https://api.pehchankidukan.com/seller/$id';
    final url = Uri.parse('$Url?keyword=$keyword');

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authentication': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody['data'];
    } else {
      throw Exception('Failed to search products: ${response.reasonPhrase}');
    }
  }

  //sort and filter
  Future<List<Product>> getSellerProducts({
    required id,
    required token,
    Map<String, dynamic> filters = const {},
    String? sort,
    int page = 1,
    int limit = 5,
  }) async {
    final baseUrl = 'https://api.pehchankidukan.com/seller/$id';
    final Map<String, dynamic> queryParams = {
      ...filters,
      'page': page.toString(),
      'limit': limit.toString(),
    };

    if (sort != null) {
      queryParams['sort'] = sort;
    }

    final url = Uri.https(baseUrl, queryParams as String);

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody['data'];
    } else {
      throw Exception('Failed to retrieve seller products: ${response.reasonPhrase}');
    }
  }



  //Categories
  Future<List<String>> getCategories(String category, {String? subCategory1, String? subCategory2, int page = 1, int limit = 5}) async {

    final url = Uri.parse('http://api.pehchankidukan.com/seller/category');

    final Map<String, dynamic> queryParameters = {
      'category': category,
      if (subCategory1 != null) 'subCategory1': subCategory1,
      if (subCategory2 != null) 'subCategory2': subCategory2,
      'page': page.toString(),
      'limit': limit.toString(),
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{'queryString': queryParameters}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody['data'];
    } else {
      throw Exception('Failed to get categories: ${response.reasonPhrase}');
    }
  }


  static Future registerPhone(var phone, var otp) async {
    final apiUrl = 'https://api.pehchankidukan.com/api/seller/register';

    Map<String, dynamic> json = {
      "phone":phone,
      "otp":otp,
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(json),
      );

      // if (response.statusCode == 201) {
      // } else {
      // }
    } catch (e) {

    }
  }

  //updateSeller
  static Future<void> updateSeller(token, id, Map<String, dynamic> updatedFields) async {
    final url = Uri.parse('https://api.pehchankidukan.com/seller/$id');
    print(id);
    print(token);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.put(
      url,
      headers: headers,
      body: json.encode(updatedFields),
    );

    if (response.statusCode == 200) {
      print('Seller updated successfully');
    } else {
      print('Failed to update seller. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }



  //get seller data
  static Future getSeller() async {
    final json = {
      "ownerName": "John Doe",
      "password": "hashed_password_here",
      "phone": "1234567890",
      "businessType": "Retail",
      "shopName": "John's Store",
      "shopOpeningTime": "2023-09-18T08:00:00Z",
      "shopClosingTime": "2023-09-18T08:00:00Z",
      "landlineNumber": "4875834759",
      "gstin": {
        "gstinNo": "GSTIN123456",
        "gstinImage": "gstin_image_url"
      },
      "fssai": {
        "licenseNumber": "FSSAI123456",
        "fssaiImage": "fssai_image_url"
      },
      "photo": "seller_photo_url",
      "address": {
        "addressOfShop": "Apt 456",
        "city": "Example City",
        "state": "Example State",
        "pincode": "12345",
        "location": "Latitude: 12.345, Longitude: 67.890"
      },
      "panCard": {
        "panNo": "ABCDE1234F",
        "panImage": "pan_card_image_url"
      },
      "bankDetails": {
        "accountNo": "1234567890",
        "ifscCode": "IFSC12345",
        "bankName": "Example Bank",
        "branchName": "Example Branch",
        "passbookImage": "bank_passbook_image_url"
      },
      "marginCharged": 10.5,
      "shopCategory": "Electronics",
      "createdAt": "2023-09-18T08:00:00Z",
      "updatedAt": "2023-09-19T09:00:00Z"
    };
    Seller seller = Seller.fromJson(json);
    return seller;
  }

  // get all orders API
  static Future fetchOrderData() async {

    // const url = "";
    // final uri = Uri.parse(url);
    // final response = await http.get(uri);
    // final body = response.body;
    // final json = jsonDecode(body);

  }


  //create Product API
  static Future<void> createProduct(Product product) async {
    final apiUrl = 'https://api/seller/:sellerid/product';

    final Map<String, dynamic> productJson = {
      "productName": product.productName,
      "category": product.category,
      // "subcategory": product.subcategory,
      "image": product.image,
      "description": product.description,
      "quantityType": product.quantityType,
      "mrpPrice": product.mrpPrice,
      "offerPrice": product.offerPrice,
      "productType": product.productType,
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productJson),
      );

      // if (response.statusCode == 200) {
      // } else {
      // }
    } catch (e) {
    }
  }

  //update Product API
  static Future<void> updateProduct(Product product, token, id) async {
    final apiUrl = 'https://api/seller/$id/product';

    final Map<String, dynamic> productJson = {
      "productName": product.productName,
      "category": product.category,
      "image": product.image,
      "description": product.description,
      "quantityType": product.quantityType,
      "mrpPrice": product.mrpPrice,
      // "offerPrice": product.offerPrice,
      "productType": product.productType,
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(productJson),
      );

      // if (response.statusCode == 200) {
      // } else {
      // }
    } catch (e) {
    }
  }


  static Future<List<Product>> getProducts(token, id) async {
    print("idddd");
    print(id);
    print(token);
    final uri = Uri.parse('https://api.pehchankidukan.com/seller/$id/products');
    final response = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final body = response.body;
    final productJson = jsonDecode(body);


    // List<Product> product = productJson['data'].map((e) => Product.fromJson(e)).toList();
    List<Product> products = List<Product>.from(productJson['data'].map((e) => Product.fromJson(e)));
    return products;
  }
}
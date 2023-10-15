
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';
import '../apis/ProductModel.dart';
import '../apis/Seller.dart';
import '../apis/orderModel.dart';
import 'package:http/http.dart' as http;

class UserApi {

  


  //search
  static Future<List<Product>> searchProducts(String keyword, token, id) async {
    final Url = 'https://api.pehchankidukan.com/seller/$id';
    final url = Uri.parse('$Url?keyword=$keyword');

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
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
  static Future<List<Product>> getSellerProducts( sort, token, id
  ) async {
    print(token);
    final baseUrl = 'https://api.pehchankidukan.com/seller/$id/products?sort=$sort';
    // final Map<String, dynamic> queryParams = {
    //   ...filters,
    //   'page': page.toString(),
    //   'limit': limit.toString(),
    // };

    // if (sort != null) {
    //   queryParams['sort'] = sort;
    // }
    //  var url;
    // if(sort!='' && sort!.length>0)
    //  url = Uri.parse('$baseUrl?sort=$sort');
    // else
      final url = Uri.parse(baseUrl);
      print(url);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    // if (response.statusCode == 201) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(responseBody['status']);
      print(responseBody['length']);
      print(responseBody['message']);
    List<Product> products = (responseBody['data'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];
    return products;
      return responseBody['data'];
    //
    // } else {
    //   throw Exception('Failed to retrieve seller products: ${response.reasonPhrase}');
    // }
  }



  //Categories
  static Future<List<String>> getCategories(String? category, {String? subCategory1, String? subCategory2, int page = 1, int limit = 5}) async {

    final url = Uri.parse('http://api.pehchankidukan.com/seller/category');

    final Map<String, dynamic> queryParameters = {
      if (category != null) 'category': category,
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
    // TokenId.token=token;
    // TokenId.id=id;
    final url = Uri.parse('https://api.pehchankidukan.com/seller/$id');
    print("id-$id");
    print("token-$token");
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
  static Future getSeller(id, token) async {
    final apiUrl = "https://api.pehchankidukan.com/seller/$id";
    final uri = Uri.parse(apiUrl);
    final response = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authentication': 'Bearer $token'
      },
    );
    final body = jsonDecode(response.body);
    final json = body['data'];
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
  static Future<void> createProduct(Product product, token, id) async {
    final apiUrl = 'https://api/seller/$id/product';

    final Map<String, dynamic> productJson = {
      "productName": product.productName,
      "category": product.category,
      "subCategory2": "Craft & Sewing Supplies Storage",//"product.subCategory2",
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

  //update Product API
  static Future<void> updateProduct(Product product, token, id) async {
    final apiUrl = 'https://api/seller/$id/product';

    final Map<String, dynamic> productJson = {
      // "productName": product.productName,
      // "category": product.category,
      // "image": product.image,
      // "description": product.description,
      // "quantityType": product.quantityType,
      // "productType": product.productType,
      "productName": product.productName,
      "category": product.category,
      "subCategory2": "Craft & Sewing Supplies Storage",//"product.subCategory2",
      "image": product.image,
      "description": product.description,
      "quantityType": product.quantityType,
      "mrpPrice": product.mrpPrice,
      "offerPrice": product.offerPrice,
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
    print("called getProducts function");
    print("id-$id");
    print("token-$token");
    final uri = Uri.parse('https://api.pehchankidukan.com/seller/$id/products');
    final response = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final body = response.body;
    final productJson = jsonDecode(body);

    print(productJson['data'].length);
    // List<Product> product = productJson['data'].map((e) => Product.fromJson(e)).toList();
    // List<Product> products = List<Product>.from(productJson['data'].map((e) => Product.fromJson(e)));
    List<Product> products = (productJson['data'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];
    return products;
  }
}
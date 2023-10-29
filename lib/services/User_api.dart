
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:e_commerce/services/tokenId.dart';
import 'package:flutter/material.dart';
import '../apis/ProductModel.dart';
import '../apis/Seller.dart';
import '../apis/orderModel.dart';
import 'package:http/http.dart' as http;

import 'Categories.dart';

class UserApi {


  static Future<void> deleteProduct(id) async {
    print("iddiidd");
    print(id);
    final Url = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products';
    final url = Uri.parse(Url);
    final Map<String, dynamic> queryParameters = {
      "productID": id
    };
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${TokenId.token}',
      },
      body:jsonEncode(queryParameters)
    );
    if (response.statusCode == 200) {
      print("deletion successfull");
    } else {
      throw Exception('Failed to Delete product: ${response.reasonPhrase}');
    }
  }


  static Future<void> getAllCategory() async {
    print("getallcategoryforfilter called");
    final apiUrl = "https://api.pehchankidukan.com/seller/category";
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${TokenId.token}',
      },
    );

    final jsonData = jsonDecode(response.body);
    print(jsonData);
    final data = (jsonData["data"][0]["category"]);
    Categories.categories.addAll(List<String>.from(data));
    // Categories.categories = jsonData["data"][0]["category"] as List<String>;

  }


  //search
  static Future<List<Product>> searchProducts(String keyword, token, id) async {
    final Url = 'https://api.pehchankidukan.com/seller/$id/products/search';
    final url = Uri.parse('$Url?keyword=$keyword');
print("query");
print(keyword);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(responseBody['status']);
      print(responseBody['length']);
      print(responseBody['message']);
      List<Product> products = (responseBody['data'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ?? [];
      // print(products[0].productName);
      // print(products[1].productName);
      return products;
    } else {
      throw Exception('Failed to search products: ${response.reasonPhrase}');
    }
  }

  //sort and filter
  static Future<List<Product>> getSellerProducts( sort, token, id
  ) async {
    // print(token);
  print("called recentlyadded $sort");
    final baseUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products?sort=$sort';

      final url = Uri.parse(baseUrl);
      // print(url);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${TokenId.token}'
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
    // print(products[0].productName);
    // print(products[1].productName);
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
      final data = jsonDecode(response.body);
      print("data");
      print(data);
    if (response.statusCode == 200) {
      print('Seller updated successfully');
    } else {
      print('Failed to update seller. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }



  //get seller data
  // static Future getSeller(id, token) async {
  //   final apiUrl = "https://api.pehchankidukan.com/seller/$id";
  //   final uri = Uri.parse(apiUrl);
  //   final response = await http.get(uri,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Authentication': 'Bearer $token'
  //     },
  //   );
  //   final body = jsonDecode(response.body);
  //   final json = body['data'];
  //   Seller seller = Seller.fromJson(json);
  //   return seller;
  // }

  // get all orders API
  static Future fetchOrderData() async {

    // const url = "";
    // final uri = Uri.parse(url);
    // final response = await http.get(uri);
    // final body = response.body;
    // final json = jsonDecode(body);

  }


  //create Product API
  static Future<String> createProduct(pName, category ,pSCategory1 ,pSCategory2, description, token, id, dummyProductList) async {
    final apiUrl = 'https://api.pehchankidukan.com/seller/${TokenId.id}/products';
    List<dynamic> itemOptionsMap = dummyProductList.map((item) {
      return {
        'mrpPrice': item.mrpPrice,
        'quantity': item.quantity,
        'unit': item.unit,
        'offerPrice': item.offerPrice,
      };
    }).toList();
    final Map<String, dynamic> productJson = {
      "productName": pName,
      "category": category,
      "subCategory1": pSCategory1,
      "subCategory2": pSCategory2,//pSCategory2,
      // "image": product.image,
      "description": description,
      "productDetails": itemOptionsMap,
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${TokenId.token}'
        },
        body: jsonEncode(productJson),
      );
        final body = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print("product created succesfully");
        print(body);
        print("body['id']");
        print(body['data']['_id']);
        return body['data']['_id'];

      } else {
        print('Failed to create product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
    return "";
  }

  //update Product API
  static Future<void> updateProduct(pName, category ,pSCategory1 ,pSCategory2, description, token, id, pid, dummyProductList) async {
    print("called update product");
    print(pName);
    print("pid-$pid");
    final apiUrl = 'https://api.pehchankidukan.com/seller/$id/products/$pid';

    // final itemOptions = quantityPricing;
    List<dynamic> itemOptionsMap = dummyProductList.map((item) {
      return {
        'mrpPrice': item.mrpPrice,
        'quantity': item.quantity,
        'unit': item.unit,
        'offerPrice': item.offerPrice,
      };
    }).toList();
    final Map<String, dynamic> productJson = {
      "productName": pName,
      "category": category,
      "subCategory1": pSCategory1,
      "subCategory2": pSCategory2,//pSCategory2,
      // "image": product.image,
      "description": description,
      "productDetails": itemOptionsMap,
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

      if (response.statusCode == 200) {
        print("product updated succesfully");

      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
  }


  static Future<List<Product>> getProducts(token, id,currentPage) async {
    print("called getProducts12 function");
    print("id-$id");
    print("token-$token");
    final uri = Uri.parse('https://api.pehchankidukan.com/seller/${TokenId.id}/products?page=$currentPage');
    final response = await http.get(uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${TokenId.token}'
      },
    );
    final body = response.body;
    final productJson = jsonDecode(body);
    print(response.statusCode);
    print(productJson);
    // print(productJson['length']);
    // print(productJson['data']['images']);
    // print('productJson[]');

    // print(productJson['data'].length);
    // List<Product> product = productJson['data'].map((e) => Product.fromJson(e)).toList();
    // List<Product> products = List<Product>.from(productJson['data'].map((e) => Product.fromJson(e)));
    List<Product> products = (productJson['data'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];
    // print(products[products.length-2].images[0]);
    // print(products.length);
    // print("products[0]");
    return products;
  }
}
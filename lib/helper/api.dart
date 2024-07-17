import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';

class Api {
  Future<List<dynamic>> get(
      {required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    Response response =
        await Dio().get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("there was an error ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> post(
      {required String url,
      required ProductModel product,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    Response response = await Dio().post(url,
        data: {
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'image': product.image,
          'category': product.category,
        },
        options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("there was an error ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> put(
      {required String url,
      required ProductModel product,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }


    try {
      Response response = await Dio().put(
        url,
        data: {
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'image': product.image,
          'category': product.category,
        },
        options: Options(headers: headers),
      );


      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("there was an error ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception("Failed to update the product: $e");
    }
  }
}

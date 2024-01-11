import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:umah/costanse/strings.dart';
import 'package:umah/web_servese/model/username.dart';

class NameWebServise {
  final dio = Dio();

 Future<List<dynamic>> get(String end) async {
    try {
      final response = await dio.get(
        baseUrl + end,
      );

      print(response);
      return response.data;
    } catch (e) {
      print("======dio=======${e.toString()}");
      return [];
    }
  }

   Future<List<dynamic>> post(String end, Object data) async {
    try {
      final response = await dio.post(
        baseUrl + end,
        data: data
      );

      print(response);
    return [response.data];
    } catch (e) {
      print("======dio=======${e.toString()}");
      return [];
    }
  }
}

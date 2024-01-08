import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:umah/costanse/strings.dart';
import 'package:umah/web_servese/model/username.dart';

class NameWebServise {
  final dio = Dio();

 Future<List<dynamic>> getAllUsers() async {
    try {
      final response = await dio.get(
        baseUrl + 'all-user',
      );

      print(response);
      return response.data;
    } catch (e) {
      print("======dio=======${e.toString()}");
      return [];
    }
  }
}

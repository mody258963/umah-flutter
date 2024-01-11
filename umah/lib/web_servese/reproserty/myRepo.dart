import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:umah/costanse/strings.dart';

import 'package:umah/web_servese/model/username.dart';
import 'package:http/http.dart' as http;
import 'package:umah/web_servese/dio/web_serv.dart';

class MyRepo {
  final NameWebServise nameWebService;

  MyRepo(this.nameWebService);


  Future<List<User>> getAllUsers(String end) async {
    final names = await nameWebService.get(end);
    final userList = names.map((names) => User.fromJson(names)).toList();
    return userList..shuffle();
  }

  Future<List<User>> login(String end, Object data) async {
    try {
      final result = await nameWebService.post(end, data);

      if (result.isNotEmpty) {
        final userid = result.map((result) => User.fromJson(result)).toList();
        return userid..shuffle();
        
      } else {
        throw Exception("Invalid response format: Empty response");
      }
    } catch (e) {
      print("Error during login: ${e.toString()}");
      throw Exception("Failed to login. Please try again.");
    }
  }

    Future<List<User>> audioUpload(String end, Object data) async {
    try {
      final result = await nameWebService.post(end, data);

      if (result.isNotEmpty) {
        final audio = result.map((audio) => User.fromJson(audio)).toList();
        return audio..shuffle();
        
      } else {
        throw Exception("Invalid response format: Empty response");
      }
    } catch (e) {
      print("Error during login: ${e.toString()}");
      throw Exception("Failed to login. Please try again.");
    }
  }
}

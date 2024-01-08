import 'dart:convert';
import 'dart:math';
import 'package:umah/costanse/strings.dart';

import 'package:umah/web_servese/model/username.dart';
import 'package:http/http.dart' as http;
import 'package:umah/web_servese/model/web_serv.dart';

class MyRepo {
  final NameWebServise nameWebService;

  MyRepo(this.nameWebService);
  Future<List<User>> getAllUsers() async {
    final names = await nameWebService.getAllUsers();
    final userList =   names.map((names) => User.fromJson(names)).toList();
    return userList..shuffle();
  }
}

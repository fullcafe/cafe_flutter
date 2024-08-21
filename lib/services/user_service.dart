import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {

  late Dio dio;

  UserService() {
    _init();
  }

  _init() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    var idToken = 'Bearer $token';
    dio = Dio(BaseOptions(baseUrl: 'http://172.30.1.73:8080',
                          headers: {'Authorization' : idToken}));
  }

  createUser(String name, DateTime birth, int characterIdx) async {
    var data = {
      'name' : name,
      'birthday': birth.toIso8601String(),
      'characterIdx' : characterIdx
    };
    var encodedData =jsonEncode(data);
    await dio.post('/register',data: encodedData);
  }

}
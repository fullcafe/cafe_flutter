import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {

  late Dio _dio;
  static UserService? _userService;

  UserService._() {}

  static Future<UserService> getService() async {
    if(_userService == null) {
      _userService = UserService._();
      await _userService!._init();
    }
    return _userService!;
  }

  _init() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    var idToken = 'Bearer $token';
    _dio = Dio(BaseOptions(baseUrl: 'http://172.30.1.73:8080',
                          headers: {'Authorization' : idToken}));
  }

  Future<Response> getUser() async{
    return await _dio.get('/user');
  }

  createUser(String name, DateTime birth, int characterIdx) async {
    var data = {
      'name' : name,
      'birthday': birth.toIso8601String(),
      'characterIdx' : characterIdx
    };
    var encodedData =jsonEncode(data);
    await _dio.post('/register',data: encodedData);
  }

}
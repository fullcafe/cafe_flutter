import 'dart:convert';

import 'package:cafe_front/models/custom_user.dart';
import 'package:cafe_front/services/dio_init.dart';
import 'package:dio/dio.dart';

class UserStore {
  static CustomUser? _user;

  static CustomUser? get user => _user;

  static _setUser(CustomUser user){
    _user = user;
  }
}


class UserService {

  final _dio = DioInit.instance;
  // 싱글톤
  static UserService? _userService;
  UserService._() {}
  static UserService get service => _userService ??= UserService._();


  Future<Response> initializeUser() async {
    var response = await getUser();
    var userData = response.data;
    var user = CustomUser.fromMap(userData);
    UserStore._setUser(user);
    return response;
  }

  Future<Response> getUser() async {
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
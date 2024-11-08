import 'dart:convert';

import 'package:cafe_front/models/custom_user.dart';
import 'package:cafe_front/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  Future<CustomUser> getUser() async {
    CustomUser user;
    try{
      var response = await _apiService.getRequest('/user');
      user = CustomUser.fromMap(response.data);
    } catch(e){
      rethrow;
    }
    return user;
  }

  Future<void> createUser(CustomUser user) async {
    var data = user.toJson();
    var encodedData = jsonEncode(data);
    await _apiService.postRequest('/register', encodedData);
  }

}
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DioInit{
  static Dio? _dio;

  static _init() async{
    var token = await FirebaseAuth.instance.currentUser?.getIdToken();
    var idToken = 'Bearer $token';
    _dio = Dio(BaseOptions(baseUrl: 'http://172.30.1.73:8080',
        headers: {'Authorization' : idToken},
        connectTimeout: const Duration(seconds: 10)));
  }

  static Future<Dio> get instance async {
    // 처음에 dio 초기화
    if(_dio == null){
      await _init();
    }
    return _dio!;
  }
}
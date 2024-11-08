import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiService {
  late Dio _dio;
  String? idToken;
  
  ApiService(){
    _init(); // 최초 dio 초기화
  }

  Future<String?> _getToken() async {
    try{
      var token = await FirebaseAuth.instance.currentUser?.getIdToken();
      idToken = 'Bearer $token';
    } catch(e){
      Fluttertoast.showToast(msg: '토큰 로드 실패');
    }
    return idToken;
  }

  _initDio(){
    _dio = Dio(BaseOptions(baseUrl: 'http://172.30.1.73:8080',
        headers: {'Authorization' : idToken},
        connectTimeout: const Duration(seconds: 10)));
  }

  _init() async {
    await _getToken();
    _initDio();
  }
  // 403 오류시 토큰 재 초기화 템플릿
  Future<Response> requestTemplate(Future<Response> Function() func) async{
    try{
      return await func();
    } on DioException catch(e){
      if(e.response?.statusCode != 403){
        rethrow;
      }
      await _init();
      return await func();
    }
  }

  Future<Response> getRequest(String path) async {
    return await requestTemplate(() async => await _dio.get(path));
  }

  Future<Response> postRequest(String path, String data) async {
    return await requestTemplate(() async => await _dio.post(path, data: data));
  }
}
/*
 예외 처리는 exception 종류에 따라 달라지는 경우가 있기에
 이후 계층에서 처리
 이때 계층이 일관될 필요는 없음 예) 가져오느냐 / 못가져오느냐 -> repository에서, 가져오느냐 / DioException 이냐 / 다른 오류냐 -> 뷰모델 란
 */
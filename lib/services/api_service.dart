import 'package:cafe_front/services/dio_init.dart';
import 'package:dio/dio.dart';

class ApiService {
  late final Dio _dio;

  ApiService() { init(); }

  init() async {
    _dio = await DioInit.instance;
  }

  Future<Response?> getRequest(String path) async {
    return _dio.get(path);
  }

  Future<Response> postRequest(String path, String data){
    return _dio.post(path, data: data);
  }

}
/*
 예외 처리는 exception 종류에 따라 달라지는 경우가 있기에
 이후 계층에서 처리
 이때 계층이 일관될 필요는 없음 예) 가져오느냐 / 못가져오느냐 -> repository에서, 가져오느냐 / DioException 이냐 / 다른 오류냐 -> 뷰모델 란
 */
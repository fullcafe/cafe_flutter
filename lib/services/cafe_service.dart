import 'package:dio/dio.dart';

import 'dio_init.dart';

class CafeService {
  late final Dio _dio;

  static CafeService? _cafeService;
  CafeService._();
  static Future<CafeService> get instance async{
    if(_cafeService == null){
      _cafeService = CafeService._();
      await _cafeService!._init();
    }
    return _cafeService!;
  }

  _init() async {
    _dio = await DioInit.instance;
  }
}
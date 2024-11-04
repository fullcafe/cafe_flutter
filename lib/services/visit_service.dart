import 'package:dio/dio.dart';

import 'dio_init.dart';

class VisitService {
  late final Dio _dio;

  static VisitService? _visitService;
  VisitService._();
  static Future<VisitService> get instance async{
    if(_visitService == null){
      _visitService = VisitService._();
      await _visitService!._init();
    }
    return _visitService!;
  }

  _init() async {
    _dio = await DioInit.instance;
  }

}
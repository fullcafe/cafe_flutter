import 'package:dio/dio.dart';

import 'dio_init.dart';

class ReviewService {
  late final Dio _dio;

  static ReviewService? _reviewService;
  ReviewService._();
  static Future<ReviewService> get instance async{
    if(_reviewService == null){
      _reviewService = ReviewService._();
      await _reviewService!._init();
    }
    return _reviewService!;
  }

  _init() async {
    _dio = await DioInit.instance;
  }
}
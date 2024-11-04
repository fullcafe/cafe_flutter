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

  createVisit(){
    // 생성
  }

  getAllVisit(){
    // 전부 가져옴
    return [];
  }

  getWriteReviewVisit(){
    // 리뷰 쓰세요에 나오는 visit
  }

  getMostCountVisit(){
    // 방문횟수
  }
}
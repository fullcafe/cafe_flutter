import 'package:dio/dio.dart';

import 'dio_init.dart';

class BookmarkService {
  late final Dio _dio;

  static BookmarkService? _bookmarkService;
  BookmarkService._();
  static Future<BookmarkService> get instance async{
    if(_bookmarkService == null){
      _bookmarkService = BookmarkService._();
      await _bookmarkService!._init();
    }
    return _bookmarkService!;
  }

  _init() async {
    _dio = await DioInit.instance;
  }
}
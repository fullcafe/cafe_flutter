import 'package:cafe_front/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
  로그인 하고 난 후 나오는 5개 페이지의 공유 스토어
  5개의 상태 표시 점 때문에 현재 페이지 정보도 알고 있음
*/

enum PageState {Next, Prev}

class AfterLoginStore with ChangeNotifier {

  int _currentPage = 0;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String _name = '';
  DateTime? _birth;
  int? _characterIdx;
  bool _toNext = true; // 다음으로 갈 수 있는지 여부
  bool _isComplete = false;

  // 키워드 선택 정보
  final List<List<bool>> _isSelected = [
    List.generate(4, (i) =>false),
    List.generate(3, (i) =>false),
    List.generate(3, (i) =>false),
    List.generate(3, (i) =>false),
    List.generate(4, (i) =>false),
    List.generate(3, (i) =>false)
  ];

  final List<int> _scores = [0,0,0,0]; // 카공 감성 실용 미식

  GlobalKey<FormState> get key => _key;

  int get currentPage => _currentPage;
  int get currentIdx => _currentPage * 2;
  String get name => _name;
  bool get toNext => _toNext;
  bool get isComplete => _isComplete;
  DateTime? get birth => _birth;
  int? get characterIdx => _characterIdx;
  TextEditingController get controller => _controller;


  List<List<bool>> get isSelected => _isSelected;
  List<int> get scores => _scores;

  updateCurrentPage(PageState state){
    if(state == PageState.Next){
      _currentPage += 1;
    } else {
      _currentPage += -1;
    }

    switch (_currentPage) {
      case < 0:
        _currentPage = 0;
      case > 4:
        _currentPage =4;
    }
    notifyListeners();
  }

  addUserName(){
    if(_key.currentState!.validate()){
      _name = _controller.text;
      _toNext = true;
    } else {
      _toNext = false;
    }
    notifyListeners();
  }

  addBirthDate(DateTime birth){
    _birth = birth;
    notifyListeners();
  }

  checkBirthDate(){
    if(_birth == null){
      _toNext = false;
    } else {
      _toNext = true;
    }
    notifyListeners();
  }

  setCharacter(){
    int maxValue = 0;
    int maxIdx = 0;
    for(int i = 0; i < _scores.length; i++){
      if(_scores[i] > maxValue){
        maxValue = _scores[i];
        maxIdx = i;
      }
    }
    _characterIdx = maxIdx;
    notifyListeners();
  }

  postUserData() async {
    UserService userService = await UserService.service;
    try{
      await userService.createUser(_name, _birth!, _characterIdx!);
      _isComplete = true;
      notifyListeners();
    } on DioException catch(e){
      if(e.response?.statusCode == 403){
        Fluttertoast.showToast(msg: '인증이 유효하지 않습니다.');
      } else if(e.response?.statusCode == 400){
        Fluttertoast.showToast(msg: '입력 형식이 잘못 되었습니다.');
      }
    } catch(e){
      Fluttertoast.showToast(msg: '요청에 실패하였습니다.');
    }
  }

  // 현재 페이지에 따라 다음버튼 로직이 달라짐
  nextHandle() async {
    switch (_currentPage) {
      case 0:
        addUserName();
      case 1:
        checkBirthDate();
      case 3:
        setCharacter();
      case 4:
        await postUserData();

    }
  }

}
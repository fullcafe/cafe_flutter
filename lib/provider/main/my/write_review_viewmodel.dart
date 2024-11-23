import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/dto/cafe_dto.dart';
import 'package:cafe_front/models/repository/review_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/dto/review_dto.dart';

class WriteReviewViewModel with ChangeNotifier {
  final ReviewRepository _reviewRepository = ReviewRepository();
  final CafeDto? cafeDto;
  final TextEditingController textEditingController = TextEditingController();
  int _numOfStar = 0;
  int get numOfStar => _numOfStar;

  final whoList = ['혼자', '연인', '친구', '어르신', '어린이', '반려동물'];
  final convenientList = ['콘센트', '5인이상 단체석', '휠체어', '엘리베이터', '내부 화장실', '충전기', '와이파이', '담요', '주차장'];
  final objectList = ['공부/작업', '대화', '데이트', 'SNS', '휴식', '브런치/식사', '디저트/빵투어'];

  final List<String> selectedWhoList = [];
  final List<String> selectedConvenientList = [];
  final List<String> selectedObjectList = [];

  set numOfStar(int value) {
    _numOfStar = value;
    notifyListeners();
  }

  WriteReviewViewModel(this.cafeDto);

  bool checkValidate(){
    if(!(numOfStar > 0)){
      Fluttertoast.showToast(msg: '별점을 선택해 주세요');
      return false;
    }
    if(selectedWhoList.isEmpty){
      Fluttertoast.showToast(msg: '누구와 갔는지 선택해주세요.');
      return false;
    }
    if(selectedConvenientList.isEmpty){
      Fluttertoast.showToast(msg: '편의 시설 정보를 선택해주세요.');
      return false;
    }
    if(selectedObjectList.isEmpty){
      Fluttertoast.showToast(msg: '어떤 목적으로 갔는지 선택해주세요.');
      return false;
    }
    if(textEditingController.text.length < 10){
      Fluttertoast.showToast(msg: '10자 이상 입력해주세요.');
      return false;
    }
    return true;
  }
  ReviewDto makeReviewDto(){
    return ReviewDto(0, _numOfStar, selectedWhoList, selectedConvenientList, selectedObjectList,
        textEditingController.text, DateTime.now(), UserStore.getInstance().user!.uid, cafeDto!.name);
  }

  Future<bool> writeReview() async {
    if(!checkValidate()) {
      return false;
    }
    try{
      await _reviewRepository.createReview(makeReviewDto());
      return true;
    } catch(e) {
      Fluttertoast.showToast(msg: '리뷰 작성에 실패하였습니다.');
      return false;
    }
  }

}
import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/dto/complex_visit_dto.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:flutter/material.dart';

class MyVisitViewModel with ChangeNotifier {
  final VisitRepository _visitRepository = VisitRepository();
  List<ComplexVisitDto>? _visitCafeList;
  List<ComplexVisitDto>? get visitCafeList => _visitCafeList;


  MyVisitViewModel(){
    getMyVisits();
  }

  getMyVisits() async {
   _visitCafeList = await _visitRepository.findAllVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }
}
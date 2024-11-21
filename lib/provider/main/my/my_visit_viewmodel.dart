import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/complex_visit.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:flutter/material.dart';

class MyVisitViewModel with ChangeNotifier {
  final VisitRepository _visitRepository = VisitRepository();
  List<ComplexVisit>? _visitCafeList;
  List<ComplexVisit>? get visitCafeList => _visitCafeList;


  MyVisitViewModel(){
    getMyVisits();
  }

  getMyVisits() async {
   _visitCafeList = await _visitRepository.findAllVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }
}
import 'package:cafe_front/common/user_store.dart';
import 'package:cafe_front/models/dto/complex_visit_dto.dart';
import 'package:cafe_front/models/repository/visit_repo.dart';
import 'package:flutter/material.dart';

class MyFavorViewModel with ChangeNotifier {
  final VisitRepository _visitRepository = VisitRepository();
  List<ComplexVisitDto>? _mostRevisitCafeList;
  List<ComplexVisitDto>? get mostRevisitCafeList => _mostRevisitCafeList;

  MyFavorViewModel(){
    getMostRevisitCafeList();
  }

  getMostRevisitCafeList() async {
    _mostRevisitCafeList = await _visitRepository.findMostCountVisitByUser(UserStore.getInstance().user!.uid);
    notifyListeners();
  }

}

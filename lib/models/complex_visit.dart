import 'package:cafe_front/models/cafe.dart';
import 'package:cafe_front/models/visit.dart';

class ComplexVisit {
  final String uid;
  final String name;
  final Cafe cafe;
  final Visit visit;

  ComplexVisit(this.uid, this.name, this.cafe, this.visit);

  factory ComplexVisit.fromJson(Map<String, dynamic> json){
    return ComplexVisit(json['uid'], json['name'], Cafe.fromJson(json['cafeDto']), Visit.fromJson(json['visitDto']));
  }

}
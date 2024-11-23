import 'package:cafe_front/models/dto/cafe_dto.dart';
import 'package:cafe_front/models/visit.dart';

class ComplexVisitDto {
  final String uid;
  final String name;
  final CafeDto cafe;
  final Visit visit;

  ComplexVisitDto(this.uid, this.name, this.cafe, this.visit);

  factory ComplexVisitDto.fromJson(Map<String, dynamic> json){
    return ComplexVisitDto(json['uid'], json['name'], CafeDto.fromJson(json['cafeDto']), Visit.fromJson(json['visitDto']));
  }

}
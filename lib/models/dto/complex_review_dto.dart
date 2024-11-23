import 'package:cafe_front/models/dto/cafe_dto.dart';
import 'package:cafe_front/models/dto/review_dto.dart';

class ComplexReviewDto {
  final String uid;
  final String name;
  final CafeDto cafeDto;
  final ReviewDto reviewDto;

  ComplexReviewDto(this.uid, this.name, this.cafeDto, this.reviewDto);
  
  factory ComplexReviewDto.fromJson(Map<String, dynamic> json){
    return ComplexReviewDto(
        json['uid'], 
        json['name'], 
        CafeDto.fromJson(json['cafeDto']), 
        ReviewDto.fromJson(json['reviewDto'])
    );
  }
}
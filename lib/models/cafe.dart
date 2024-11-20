import 'package:cafe_front/models/review.dart';

import 'cafe_keyword.dart';

class Cafe {
  final String name;
  final String address;
  final String phone;
  final String url;
  final bool petFriendly;
  final bool wifi;
  final bool takeout;
  final bool groupFriendly;
  final bool easyPayment;
  final bool parking;
  final bool delivery;
  final List<CafeKeyword> keywords;
  final List<Review> reviews;


  Cafe(
      this.name,
      this.address,
      this.phone,
      this.url,
      this.petFriendly,
      this.wifi,
      this.takeout,
      this.groupFriendly,
      this.easyPayment,
      this.parking,
      this.delivery,
      this.keywords,
      this.reviews
      );

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
        json['name'] ?? '카페 이름',
        json['address'] ?? '주소 없음',
        json['phone'] ?? '전화번호 없음',
        json['url'] ?? '',
        json['petFriendly'] ?? false,
        json['wifi'] ?? false,
        json['takeout'] ?? false,
        json['groupFriendly'] ?? false,
        json['easyPayment'] ?? false,
        json['parking'] ?? false,
        json['delivery'] ?? false,
        (json['keywords'] as List<dynamic>?)
                ?.map((keywordJson) => CafeKeyword.fromJson(keywordJson))
                .toList() ??
            [],
        (json['reviews'] as List<dynamic>?)
                ?.map((review) => Review.fromJson(review))
                .toList() ??
            []);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'url': url,
      'petFriendly': petFriendly,
      'wifi': wifi,
      'takeout': takeout,
      'groupFriendly': groupFriendly,
      'easyPayment': easyPayment,
      'parking': parking,
      'delivery': delivery,
      'keywords': keywords.map((keyword) => keyword.toJson()).toList(),
      'reviews' : reviews.map((review)=>review.toJson()).toList()
    };
  }
}

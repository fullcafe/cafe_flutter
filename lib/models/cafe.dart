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
  final List<CafeKeyword> keywords; // 키워드 리스트를 CafeKeyword 객체로 받음

  Cafe({
    required this.name,
    required this.address,
    required this.phone,
    required this.url,
    required this.petFriendly,
    required this.wifi,
    required this.takeout,
    required this.groupFriendly,
    required this.easyPayment,
    required this.parking,
    required this.delivery,
    required this.keywords,
  });

  // JSON 데이터를 Cafe 객체로 변환하는 factory 생성자
  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      name: json['name'] ?? '카페 이름',
      address: json['address'] ?? '주소 없음',
      phone: json['phone'] ?? '전화번호 없음',
      url: json['url'] ?? '',
      petFriendly: json['petFriendly'] ?? false,
      wifi: json['wifi'] ?? false,
      takeout: json['takeout'] ?? false,
      groupFriendly: json['groupFriendly'] ?? false,
      easyPayment: json['easyPayment'] ?? false,
      parking: json['parking'] ?? false,
      delivery: json['delivery'] ?? false,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((keywordJson) => CafeKeyword.fromJson(keywordJson))
          .toList() ??
          [], // 키워드를 CafeKeyword 객체 리스트로 변환
    );
  }
}
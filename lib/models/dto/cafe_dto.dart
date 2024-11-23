class CafeDto {
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
  final List<String> keywords;
  CafeDto(
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
      this.keywords);

  factory CafeDto.fromJson(Map<String, dynamic> json){
    return CafeDto(
        json['name'],
        json['address'] ?? '',
        json['phone'] ?? '',
        json['url'] ?? '',
        json['petFriendly'] ?? false,
        json['wifi'] ?? false,
        json['takeout'] ?? false,
        json['groupFriendly'] ?? false,
        json['easyPayment'] ?? false,
        json['parking'] ?? false,
        json['delivery'] ?? false,
        (json['keywords'] as List).map((e) => e.toString()).toList()
    );
  }
}
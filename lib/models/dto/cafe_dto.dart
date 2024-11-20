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
        json['address'],
        json['phone'],
        json['url'],
        json['petFriendly'],
        json['wifi'],
        json['takeout'],
        json['groupFriendly'],
        json['easyPayment'],
        json['parking'],
        json['delivery'],
        json['keywords']
    );
  }
}
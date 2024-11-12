class CafeFilter {
  String? name;
  bool? wifi;
  bool? petFriendly;
  bool? takeout;
  bool? groupFriendly;
  bool? easyPayment;
  bool? parking;
  bool? delivery;
  List<String>? keywords;
  // 생성자 추가
  CafeFilter({
    this.name,
    this.wifi,
    this.petFriendly,
    this.takeout,
    this.groupFriendly,
    this.easyPayment,
    this.parking,
    this.delivery,
    this.keywords,
  });

}
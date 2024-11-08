class CafeKeyword {
  final String keyword;
  final String cafeName;
  final int frequency;

  CafeKeyword({
    required this.keyword,
    required this.cafeName,
    required this.frequency,
  });

  // JSON 데이터를 CafeKeyword 객체로 변환하는 factory 생성자
  factory CafeKeyword.fromJson(Map<String, dynamic> json) {
    return CafeKeyword(
      keyword: json['keyword'] ?? '키워드 없음',
      cafeName: json['cafeName'] ?? '카페 이름 없음',
      frequency: json['frequency'] ?? 0,
    );
  }
}

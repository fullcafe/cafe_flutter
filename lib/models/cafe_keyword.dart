class CafeKeyword {
  final String keyword;
  final String cafeName;
  final int frequency;

  CafeKeyword({
    required this.keyword,
    required this.cafeName,
    required this.frequency,
  });


  factory CafeKeyword.fromJson(Map<String, dynamic> json) {
    return CafeKeyword(
      keyword: json['keyword'] ?? '키워드 없음',
      cafeName: json['cafeName'] ?? '카페 이름 없음',
      frequency: json['frequency'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'keyword': keyword,
      'cafeName': cafeName,
      'frequency': frequency,
    };
  }

  @override
  String toString() {
    return 'CafeKeyword(keyword: $keyword, cafeName: $cafeName, frequency: $frequency)';
  }
}

// visit 모델

class Visit {
  final String uid;          // 사용자 ID
  final String cafeName;      // 카페 이름
  final int count;            // 방문 횟수
  final bool writeReview;     // 리뷰 작성 여부
  final DateTime recent;      // 최근 방문 시간

  Visit({
    required this.uid,
    required this.cafeName,
    required this.count,
    required this.writeReview,
    required this.recent,
  });

  // JSON 데이터를 Visit 객체로 변환하는 factory 생성자
  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      uid: json['uid'] as String,
      cafeName: json['cafeName'] as String,
      count: json['count'] as int? ?? 0,
      writeReview: json['writeReview'] as bool? ?? false,
      recent: DateTime.parse(json['recent']),
    );
  }

  // Visit 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'uid' : uid,
      'cafeName': cafeName,
      'count': count,
      'writeReview': writeReview,
      'recent': recent.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Visit(uid: $uid, cafeName: $cafeName, count: $count, writeReview: $writeReview, recent: $recent)';
  }
}

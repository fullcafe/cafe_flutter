import 'custom_user.dart';
import 'cafe.dart';

class Review {
  final int id;
  final int numOfStar;
  final List<String> who;
  final List<String> convenient;
  final List<String> object;
  final String content;
  final DateTime timestamp;
  final CustomUser user;

  Review({
    required this.id,
    required this.numOfStar,
    required this.who,
    required this.convenient,
    required this.object,
    required this.content,
    required this.timestamp,
    required this.user
  });

  /// JSON 데이터를 Review 객체로 변환
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      numOfStar: json['numOfStar'],
      who: List<String>.from(json['who'] ?? []),
      convenient: List<String>.from(json['convenient'] ?? []),
      object: List<String>.from(json['object'] ?? []),
      content: json['content'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
      user: CustomUser.fromMap(json['user'])
    );
  }

  /// Review 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numOfStar': numOfStar,
      'who': who,
      'convenient': convenient,
      'object': object,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'user': user.toJson(),
    };
  }

  @override
  String toString() {
    return 'Review(id: $id, numOfStar: $numOfStar, who: $who, '
        'convenient: $convenient, object: $object, content: $content)';
  }
}

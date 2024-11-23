class ReviewDto {
  int _id;
  int _numOfStar;
  List<String> _who;
  List<String> _convenient;
  List<String> _object;
  String _content;
  DateTime _timestamp;
  String _uid;
  String _cafeName;


  int get id => _id;

  ReviewDto(this._id, this._numOfStar, this._who, this._convenient,
      this._object, this._content, this._timestamp,this._uid, this._cafeName);
  factory ReviewDto.fromJson(Map<String, dynamic> json){
    return ReviewDto(
        json['id'],
        json['numOfStar'],
        (json['who'] as List).map((e) => e.toString()).toList(),
        (json['convenient'] as List).map((e) => e.toString()).toList(),
        (json['object'] as List).map((e) => e.toString()).toList(),
        json['content'],
        DateTime.parse(json['timestamp']),
        json['uid'],
        json['cafeName']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numOfStar': _numOfStar,
      'who': _who,
      'convenient': _convenient,
      'object': _object,
      'content': _content,
      'timestamp': _timestamp.toIso8601String(),
      'uid': _uid,
      'cafeName': _cafeName
    };
  }

  int get numOfStar => _numOfStar;

  List<String> get who => _who;

  List<String> get convenient => _convenient;

  List<String> get object => _object;

  String get content => _content;

  DateTime get timestamp => _timestamp;

  String get uid => _uid;

  String get cafeName => _cafeName;
}
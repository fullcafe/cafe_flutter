class CustomUser {
  late String _uid;
  late String _email;
  late String _name;
  late String _birth;
  late int _characterIdx;
  late List<String> _preferredKeywords;

  CustomUser(this._uid, this._email, this._name, this._birth, this._characterIdx);

  CustomUser.fromMap(Map<String, dynamic> map) {
    _uid = map['uid'];
    _email = map['email'];
    _name = map['name'];
    _birth = map['birthday'];
    _characterIdx = map['characterIdx'];
  }

  int get characterIdx => _characterIdx;
  String get birth => _birth;
  String get name => _name;
  String get email => _email;
  String get uid => _uid;
  List<String> get preferredKeywords => _preferredKeywords;

  Map<String, dynamic> toJson() {
    return {
      'uid': _uid,
      'email': _email,
      'name': _name,
      'birthday': _birth,
      'characterIdx': _characterIdx,
    };
  }

  @override
  String toString() {
    return 'CustomUser(uid: $_uid, email: $_email, name: $_name, birth: $_birth, '
        'characterIdx: $_characterIdx, preferredKeywords: $_preferredKeywords)';
  }
}
//  ['아메리카노', '디저트', '커피', '라떼']
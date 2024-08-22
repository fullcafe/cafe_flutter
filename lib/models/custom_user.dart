class CustomUser {
  late String _uid;
  late String _email;
  late String _name;
  late String _birth;
  late int _characterIdx;

  CustomUser.fromMap(Map map){
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
}
import 'package:flutter/material.dart';

class AfterLoginStore with ChangeNotifier {

  int _currentIdx = 0;

  int get currentIdx => _currentIdx;
}
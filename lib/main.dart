import 'package:cafe_front/constants/routes.dart';
import 'package:cafe_front/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 스플래시 시작
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 리스너 설정
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  // 유저 정보 확인
  var initRoute = await _checkUserCredential();

  runApp(MaterialApp(
      theme: getMyAppTheme(),
      initialRoute: initRoute,
      routes: routes,
  ));
  // 스플래시 종료
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // 테스트용
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
    );
  }
}

Future<String> _checkUserCredential() async {
  var user = FirebaseAuth.instance.currentUser;
  if(user == null) {
    return '/login';
  }
  UserService userService = UserService.service;
  try{
    await userService.getUser();
    return '/main';
  } on DioException catch(e){
    // 없어서 못 가져옴
    if(e.response?.statusCode == 404) {
      return '/after';
    }
    Fluttertoast.showToast(msg: e.response?.statusMessage ?? '정보를 가져오는데 실패하였습니다.');
    return '/login';
  } catch(e){
    // 그외 예외
    Fluttertoast.showToast(msg: '정보를 가져오는데 실패하였습니다.');
    return '/login';
  }
}

ThemeData getMyAppTheme(){
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.orange),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.white,surfaceTintColor: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: CustomColors.deepGrey)
      )
  );
}


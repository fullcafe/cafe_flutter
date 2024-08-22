import 'package:cafe_front/constants/routes.dart';
import 'package:cafe_front/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
  UserService userService = await UserService.getService();
  try{
    var response = await userService.getUser();
    return '/main';
  } catch(e){
    return '/after';
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


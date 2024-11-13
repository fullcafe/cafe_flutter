import 'package:cafe_front/constants/routes.dart';
import 'package:cafe_front/common/user_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'constants/colors.dart';
import 'firebase_options.dart';
import 'provider/main/cafe_detail/search_view_model.dart'; // Import SearchViewModel

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Preserve the splash screen during app initialization
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase authentication listener
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  // Check user credentials and determine initial route
  var initRoute = await _checkUserCredential();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchViewModel()), // Provide SearchViewModel here
      ],
      child: MaterialApp(
        theme: getMyAppTheme(),
        initialRoute: initRoute,
        routes: routes,
      ),
    ),
  );

  // Remove splash screen after initialization
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('data')), // Placeholder for initial UI
    );
  }
}

Future<String> _checkUserCredential() async {
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return '/login';
  }
  UserStore userStore = UserStore.getInstance();
  await userStore.getUser();
  switch (userStore.status) {
    case UserStatus.EXIST:
      return '/main';
    case UserStatus.LOGIN:
      return '/after';
    case UserStatus.ERROR:
      return '/login';
  }
}

ThemeData getMyAppTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.orange),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: Colors.white, surfaceTintColor: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: CustomColors.deepGrey),
    ),
  );
}

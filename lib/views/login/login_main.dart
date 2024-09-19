import 'package:cafe_front/services/user_service.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 상반
            Expanded(flex: 7,child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            width: 60,
                            child: Image.asset('assets/logos/main_logo.png')
                        )),
                  ),
                  const Expanded(child:
                  Text('당신의 입맛과 취향을\n     저격할 카페를\n   추천해드릴게요.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                  )
                ],
              ),
            )),
            // 하반
            Expanded(
                flex:2,
                child: Column(
                  children: [
                    // 로그인/회원가입
                    const SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(),
                              )
                          ),
                          Text('로그인/회원가입',style: TextStyle(color: Colors.grey),),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(),
                              )
                          ),
                        ],
                      ),
                    ),
                    // 구글 버튼
                    Expanded(flex:2,child: GestureDetector(
                      onTap: () async{
                        try{
                          await signInWithGoogle();

                          var nextPage= await _checkUserCredential();
                          // 로그인 후 유저가 등록 되었느냐에 따라 이동하는 페이지가 다름
                          Navigator.pushNamedAndRemoveUntil(context, nextPage,ModalRoute.withName('/'));
                        } catch(e){
                          Fluttertoast.showToast(msg: '로그인 실패');
                        }
                      },
                      child: CustomButtonLayout(
                        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                width: 30,
                                child: Center(child: Image.asset('assets/icons/google_logo.png',scale: 0.1,))
                            ),
                            const Center(child: Text('Google로 계속하기',style: TextStyle(fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    )),
                    // 로그인 하기(하드)
                    const Expanded(child: Text('로그인 하기',style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                )
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // 메인 화면으로 바로 이동
                  Navigator.pushNamedAndRemoveUntil(context, '/main', ModalRoute.withName('/'));
                },
                child: const CustomButtonLayout(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                  width: double.infinity,
                  borderColor: CustomColors.deepGrey,
                  child: Center(
                    child: Text(
                      '메인으로 이동',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.deepGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // 인증
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // auth 디테일 겟
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // credential 생성
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // UserCredential 리턴
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<String> _checkUserCredential() async {
    UserService userService = await UserService.getService();
    try{
      var response = await userService.getUser();
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

}
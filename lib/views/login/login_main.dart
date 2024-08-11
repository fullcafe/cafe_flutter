import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

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
                  Expanded(child: Container()),
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
                    Expanded(flex:3,child: GestureDetector(
                      onTap: (){
                        // 로그인 후 유저가 등록 되었느냐에 따라 이동하는 페이지가 다름
                        Navigator.pushNamedAndRemoveUntil(context, '/login/after',ModalRoute.withName('/'));
                      },
                      child: CustomButtonLayout(
                        margin: const EdgeInsets.fromLTRB(10, 25, 10, 25),
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
                    const Expanded(flex:2,child: Text('로그인 하기',style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

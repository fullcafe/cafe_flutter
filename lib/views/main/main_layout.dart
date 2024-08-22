import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/views/main/onboarding/onboarding_layout.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    onBoarding();
  }

  onBoarding() async {
    // 프레임 바인딩 후 실행
    SchedulerBinding.instance.addPostFrameCallback((_){
      if(!isChecked) {
        showCupertinoModalPopup(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const OnBoarding();
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('메인')),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = PageController();
    return Container(
      height: size.height * 0.7,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20),)
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
                height: 10,
                width: 50,
                child: Divider(color: Colors.grey,thickness: 3,)
            ),
            const SizedBox(height: 20,),
            const Align(alignment: Alignment.centerLeft,
                child: Text('이런 기능들이 있어요!',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,decoration: TextDecoration.none),)),
            const SizedBox(height: 20,),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  OnBoardingLayout(
                    onTap: (){
                      controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    title: '홈',
                    description: '   ##님의 카페 취향 분석과\n분위기에 맞는 카페를 추천드려요',
                  ),
                  OnBoardingLayout(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


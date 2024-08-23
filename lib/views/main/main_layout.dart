import 'package:cafe_front/services/user_service.dart';
import 'package:cafe_front/views/main/onboarding/onboarding_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _getUser();
    _getInitData();
    onBoarding();
  }

  _getUser() async {
    var userService = await UserService.getService();
    try{
      await userService.initializeUser();
    } catch(e){
      Fluttertoast.showToast(msg: '유저 정보를 불러오는데 실패하였습니다.');
    }
  }

  _getInitData() async {
    var pref = await SharedPreferences.getInstance();
    bool? checked = pref.getBool('checked');
    isChecked = checked ?? false;
  }

  onBoarding() async {
    // 프레임 바인딩 후 실행
    SchedulerBinding.instance.addPostFrameCallback((_) async{
      // 유저 정보 가져오는 딜레이
      await Future.delayed(const Duration(milliseconds: 300));
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
    var user = UserStore.user;
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
                      controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    title: '홈',
                    description: '  ${user?.name}님의 카페 취향 분석과\n분위기에 맞는 카페를 추천드려요',
                  ),
                  OnBoardingLayout(
                    onTap: (){
                      controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    title: '검색',
                    description: '키워드 추천 기능과 검색 필터 기능으로\n${user?.name}님이 원하시는 카페를 찾아드려요',
                    currentIdx: 2,
                  ),
                  OnBoardingLayout(
                    onTap: (){
                      controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    title: '커뮤니티',
                    description: '친구들과 취향이 비슷한 사람들이\n   방문한 카페를 확인해보세요',
                    currentIdx: 4,
                  ),
                  OnBoardingLayout(
                    onTap: () async {
                      var pref = await SharedPreferences.getInstance();
                      await pref.setBool('checked', true); // 체크 여부를 true로 변경
                      Navigator.pop(context);
                    },
                    title: '마이페이지',
                    description: '친구들과 취향이 비슷한 사람들이\n   방문한 카페를 확인해보세요',
                    currentIdx: 6,
                    buttonName: '완료',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

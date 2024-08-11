import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/views/login/set_age_page.dart';
import 'package:cafe_front/views/login/set_nickname_page.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  final pages = const [SetNicknamePage(), SetAgePage()];
  final pageController = PageController();
  var currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              pageController.animateToPage(currentPage - 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
            },
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 6,
                  child: PageView.builder(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pages.length,
                      itemBuilder: (context, i){
                        return pages[i];
                      }
                  )
              ),
              // 다음 버튼
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      pageController.animateToPage(currentPage + 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);//fdf
                    },
                    child: const CustomButtonLayout(
                      margin: EdgeInsets.fromLTRB(10, 25, 10, 25),
                      width: double.infinity,
                      borderColor: CustomColors.deepGrey,
                      child: Center(child: Text('다음',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),)),
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
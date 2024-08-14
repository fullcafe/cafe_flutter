import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:cafe_front/views/login/set_age_page.dart';
import 'package:cafe_front/views/login/set_nickname_page.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  final pages = const [SetNicknamePage(), SetAgePage()];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final store = context.watch<AfterLoginStore>();

    toUpdatePage(int value){
      store.updateCurrentPage(value);
      pageController.animateToPage(store.currentPage, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              toUpdatePage(-1);
            },
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: totalHeight / 1.2,
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
                          if(store.key.currentState!.validate()){
                            toUpdatePage(1);
                          }
                        },
                        child: const CustomButtonLayout(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          width: double.infinity,
                          borderColor: CustomColors.deepGrey,
                          child: Center(child: Text('다음',style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.deepGrey),)),
                        ),
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

}
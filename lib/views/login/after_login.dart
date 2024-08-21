import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/login/after_login_store.dart';
import 'package:cafe_front/views/login/after_login/set_address_page.dart';
import 'package:cafe_front/views/login/after_login/set_age_page.dart';
import 'package:cafe_front/views/login/after_login/set_cafe_style_page.dart';
import 'package:cafe_front/views/login/after_login/set_character_page.dart';
import 'package:cafe_front/views/login/after_login/set_nickname_page.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  final pages = const [SetNicknamePage(), SetAgePage(),SetAddressPage(), SetCafeStylePage(), SetCharacterPage()];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final store = context.watch<AfterLoginStore>();

    toUpdatePage(PageState state){
      store.updateCurrentPage(state);
      pageController.animateToPage(store.currentPage, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop ,result) async {
        toUpdatePage(PageState.Prev);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async{
                toUpdatePage(PageState.Prev);
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
                          onTap: () async {
                            // To do 처리
                            await store.nextHandle();
                            // 조건을 만족하면 다음
                            if(store.toNext){
                              toUpdatePage(PageState.Next);
                            }
                            // 조건을 만족하면 페이지 넘김
                            if(store.isComplete){
                              Navigator.pushNamedAndRemoveUntil(context, '/main',ModalRoute.withName('/'));
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
      ),
    );
  }

}
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/my_review_store.dart';
import 'package:cafe_front/services/user_service.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = context.watch<MyReviewStore>();
    // 값 가져올 때 까지 로딩
    if(store.testValue == null){
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const BackButtonAppBar(text: '내 리뷰',),
          ListTile(
            leading: CircleAvatar(radius: 25,),
            title: Text('${UserStore.user?.name}',style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('블라블라',style: TextStyle(color: CustomColors.deepGrey),),
            trailing: Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swap_vert,color: Colors.white,),
                  Text('전체·최신순',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          Expanded(child: ListView(
            children: [
              ReviewListLayout(),
            ],
          )),
        ],
      )),
    );
  }
}

class ReviewListLayout extends StatelessWidget {
  const ReviewListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      color: Colors.red,
      child: Column(
        children: [
          Expanded(flex: 2,child: PageView(
            controller: PageController(viewportFraction: 0.7),
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.black,
              ),
            ],
          )),
          Expanded(child: Row(
            children: [
              Container(color: Colors.black,)
            ],
          )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

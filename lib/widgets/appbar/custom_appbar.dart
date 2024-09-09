import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({
    Key? key,
    this.logo = const DefaultLogo(),
  }) : super(key: key);
  final Widget logo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          logo,
          const Expanded(child: SizedBox()), // 간격
          const AppBarIconSet(),
        ],
      ),
    );
  }
}

class BackButtonAppBar extends StatelessWidget {
  const BackButtonAppBar({
    Key? key,
    this.text = '',
    this.isWhite = false,
  }) : super(key: key);
  final String text;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return isWhite?
    SizedBox(
      height: 60,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  highlightColor: Colors.transparent,
                  icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
              const AppBarIconSet(isWhite: true,),
            ],
          ),
          Center(child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),)),
        ],
      ),
    )
        :
    SizedBox(
      height: 60,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  highlightColor: Colors.transparent,
                  icon: const Icon(Icons.arrow_back_ios)),
              const AppBarIconSet(),
            ],
          ),
          Center(child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
        ],
      ),
    );
  }
}

class AppBarIconSet extends StatelessWidget {
  const AppBarIconSet({
    Key? key,
    this.isWhite = false,
  }) : super(key: key);
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    var defaultLink = 'assets/icons/';
    return isWhite?
    SizedBox(
      width: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: (){
                  print('알림 탭');
                },
                child: SizedBox(width: 25,child: Image.asset('${defaultLink}notification_white.png'))
            ),
            GestureDetector(
                onTap: (){
                  print('북마크 탭');
                },
                child: SizedBox(width: 20,child: Image.asset('${defaultLink}bookmark_white.png'))
            ),
          ]
      ),
    )
        :
    SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: (){
                print('알림 탭');
              },
              child: SizedBox(width: 25,child: Image.asset('${defaultLink}notification.png'))
          ),
          GestureDetector(
              onTap: (){
                print('북마크 탭');
              },
              child: SizedBox(width: 20,child: Image.asset('${defaultLink}bookmark.png'))
          ),
        ]
      ),
    );
  }
}

class DefaultLogo extends StatelessWidget {
  const DefaultLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 90,
        child: Image.asset('assets/logos/Group 903.png')
    );
  }
}



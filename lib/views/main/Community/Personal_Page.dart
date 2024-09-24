import 'package:cafe_front/views/main/Community/Personal_Recommend.dart';
import 'package:cafe_front/views/main/Curation/MeetPage.dart';
import 'package:flutter/material.dart';
import '../../../widgets/appbar/custom_appbar.dart';
import '../Curation/Curation_page.dart';
import 'Personal_Review.dart';
import 'package:cafe_front/constants/colors.dart'; // CustomColors가 정의된 파일
import 'package:cafe_front/widgets/button/custom_button_layout.dart'; // CustomButtonLayout이 정의된 파일

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _personalPageState();
}

class _personalPageState extends State<PersonalPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height:20),
            const BackButtonAppBar(),
            // 추가된 사용자 정보 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30), // 패딩 추가
              child: SizedBox(
                height: 50, // 높이를 적절히 조정
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // PersonalPage로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PersonalPage()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.transparent, // 배경색 투명 설정 (옵션)
                        backgroundImage: AssetImage('assets/images/Community/Ellipse 52.png'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GestureDetector로 텍스트 감싸기
                        GestureDetector(
                          onTap: () {
                            // PersonalPage로 이동
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PersonalPage()),
                            );
                          },
                          child: const Text(
                            '디저트 조아',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 3), // 텍스트 간의 간격 조정
                        const Text(
                          '취향 매칭률: 94%',
                          style: TextStyle(color: CustomColors.deepGrey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButtonLayout(
                      borderColor: CustomColors.deepGrey,
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text('팔로우', style: TextStyle(color: CustomColors.deepGrey)),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            // TabBar를 포함한 탭 영역
            Container(
              color: const Color(0xfffafafa),
              width: double.infinity, // 전체 너비를 지정.
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.brown,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                //isScrollable: true, // 탭바가 스크롤 가능하도록 설정
                labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // 선택된 탭 텍스트 스타일
                unselectedLabelStyle: const TextStyle(fontSize: 14), // 선택되지 않은 탭 텍스트 스타일
                padding: EdgeInsets.zero,
                tabs: const [
                  Tab(text: '리뷰'),
                  Tab(text: '찜리스트'),
                ],
              ),
            ),
            // TabBarView를 화면의 남은 공간을 차지하도록 설정
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // "큐레이션" 페이지
                  PersonalReviewPage(),
                  // "모임" 페이지
                  PersonalRecommendPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

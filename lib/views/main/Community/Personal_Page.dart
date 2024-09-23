import 'package:cafe_front/views/main/Curation/MeetPage.dart';
import 'package:flutter/material.dart';
import '../../../widgets/appbar/custom_appbar.dart';
import '../Curation/Curation_page.dart';



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
            const BackButtonAppBar(),
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
                  const CurationPage(),
                  // "모임" 페이지
                  MeetPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
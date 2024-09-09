import 'package:flutter/material.dart';
import '../../../widgets/appbar/custom_appbar.dart';
import 'curation_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _homePageState();
}

class _homePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
            // LogoAppBar를 화면 상단에 배치
            const LogoAppBar(),

            // TabBar를 포함한 탭 영역
            Container(
              color: const Color(0xfffafafa),
              width: double.infinity, // Row가 아니라 전체 너비를 지정합니다.
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.brown,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: '큐레이션'),
                  Tab(text: '모임'),
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
                  Center(
                    child: Text('모임 콘텐츠', style: TextStyle(fontSize: 24)),
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

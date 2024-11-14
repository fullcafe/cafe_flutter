import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/main/curation/curation_viewmodel.dart';
import '../../../widgets/listview/build_friend_list.dart';
import '../../../widgets/listview/build_keyword_cloud.dart';
import '../../../widgets/listview/build_list_view.dart';
import '../curation/section_title.dart';
import 'More_Curation_Page.dart';

class MeetPage extends StatefulWidget {
  const MeetPage({Key? key}) : super(key: key);

  @override
  State<MeetPage> createState() => _MeetPageState();
}

class _MeetPageState extends State<MeetPage> {
  @override
  void initState() {
    super.initState();
    // CurationViewModel에서 데이터 fetch
    Future.microtask(() {
      context.read<CurationViewModel>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurationViewModel()..fetchData(),
      child: Builder(
        builder: (context) {
          final viewModel = context.watch<CurationViewModel>();

          if (viewModel.cafes == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final cafes = viewModel.cafes!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Frame 434.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      right: 20,
                      child: Text(
                        '카공족 맞춤 집중이 잘되는\n조용한 카페 3선',
                        style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'Pretendard-Bold',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 5.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 28,
                      left: 360,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoreCurationPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/image_511371.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(title: '이 장소에서 만나는 건 어때요?'),
                      buildHorizontalListView(context),
                      const SizedBox(height: 30),
                      const SectionTitle(title: '우리들의 취향 집합 카페'),
                      buildHorizontalListView(context),
                      const SizedBox(height: 30),
                      const SectionTitle(title: '이 카페 한 번 더?'),
                      buildHorizontalListView(context),
                      const SizedBox(height: 30),
                      const SectionTitle(title: '상반기 우리의 취향 공통점 키워드'),
                      buildKeywordCloud(),
                      const SizedBox(height: 30),
                      buildFriendList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

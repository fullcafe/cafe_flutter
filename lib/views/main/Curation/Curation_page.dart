import 'dart:math';
import 'package:cafe_front/provider/main/curation/curation_viewmodel.dart';
import 'package:cafe_front/views/main/Curation/More_Curation_Page.dart';
import 'package:cafe_front/views/main/Curation/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/listview/build_list_view.dart';

class CurationPage extends StatefulWidget {
  const CurationPage({Key? key}) : super(key: key);

  @override
  State<CurationPage> createState() => _CurationPageState();
}

class _CurationPageState extends State<CurationPage> {
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    // 카페 데이터 fetch
    context.read<CurationViewModel>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // 뷰모델
    var viewModel = context.watch<CurationViewModel>();
    // Future 데이터가 아닌 뷰모델 값을 기준으로 화면 업데이트
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
                    image: AssetImage('assets/images/Frame 6.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Text(
                  '장마철에 딱 맞는\n당신의 취향 저격 카페 3선',
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Pretendard-Bold',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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
                const SectionTitle(title: '집 주변 카페 정복하기'),
                buildHorizontalListView(cafes.sublist(0, 3)),
                const SizedBox(height: 30),
                const SectionTitle(title: '서진님의 취향저격 카페'),
                buildHorizontalListView(viewModel.preferredCafes ?? []),
                const SizedBox(height: 30),
                const SectionTitle(title: '이 카페 한 번 더?'),
                buildListViewWithCustomCards(cafes),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cafe_front/provider/main/cafe/cafe_detail_viewmodel.dart';
import 'package:cafe_front/views/main/Cafe/cafe_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/views/main/search/search_form.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:provider/provider.dart';
import 'package:cafe_front/provider/main/search/search_view_model.dart';

import '../../../models/cafe.dart';
import '../../../widgets/appbar/FilterBar.dart';
import 'SearchBaaseCafeList.dart';


class SearchBase extends StatelessWidget {
  const SearchBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    var previousSize = viewModel.previousCafe?.length ?? 0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomSearchBar(),
              FilterBar(
                onFilterApplied: (selectedFilters,booleanFilters) {
                  final viewModel = context.read<SearchViewModel>();

                  // 선택된 필터에서 빈 값을 제외하고 키워드로 변환
                  final keywords = selectedFilters.entries
                      .where((entry) => entry.value.isNotEmpty) // 빈 값을 제외
                      .expand((entry) => entry.value) // 키워드 리스트로 변환
                      .toList();
                  print('적용된 필터: $selectedFilters');

                  print('검색 실행 키워드: $keywords'); // 디버깅 로그
                  viewModel.searchCafesFilter(
                    keywords: keywords,
                    petFriendly: booleanFilters['petFriendly'],
                    wifi: booleanFilters['wifi'],
                    parking: booleanFilters['parking'],
                    delivery: booleanFilters['delivery'],
                  );// 필터 기반 검색
                  // SearchForm으로 이동
                  if (keywords.isNotEmpty) {
                    viewModel.navigator(
                      context,
                      SearchForm(keyword: keywords.join(', ')), // 키워드를 전달
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              _buildSearchKeywords(),
              const SizedBox(height: 20),
              previousSize > 0? _buildPreviousVisitedCafes(context) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  // 검색 키워드 섹션
  Widget _buildSearchKeywords() {
    return Column(
      children: const [
        SearchKeyword(title: '최근 검색어'),
        SearchKeyword(title: '내 주변 인기 검색어'),
      ],
    );
  }

  // 최근 방문한 카페 목록 예시
  Widget _buildPreviousVisitedCafes(BuildContext context) {
    var viewModel = context.watch<SearchViewModel>();
    var previousCafe = viewModel.previousCafe;
    return Container(
      margin: const EdgeInsets.all(10),
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '전에 갔던 이 카페는 어때요?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: previousCafe?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                        create: (context) => CafeDetailViewModel(previousCafe![index].cafe.name),
                        child: const CafeDetailPage(),
                    )));
                  },
                  child: SearchBaseCafeList(
                    cafe: Cafe(
                      previousCafe![index].cafe.name,
                      previousCafe[index].cafe.address,
                      previousCafe[index].cafe.phone,
                      previousCafe[index].cafe.url,
                      previousCafe[index].cafe.petFriendly,
                      previousCafe[index].cafe.wifi,
                      previousCafe[index].cafe.takeout,
                      previousCafe[index].cafe.groupFriendly,
                      previousCafe[index].cafe.easyPayment,
                      previousCafe[index].cafe.parking,
                      previousCafe[index].cafe.delivery,
                      [],
                      [],
                    ),
                    visitCount: previousCafe[index].visit.count,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 검색 바
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Container(
      margin: const EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: viewModel.searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '지역, 메뉴, 매장명 검색',
                ),
                onSubmitted: (value) {
                  _navigateToSearchForm(context, viewModel);
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _navigateToSearchForm(context, viewModel);
            },
          ),
        ],
      ),
    );
  }

  void _navigateToSearchForm(BuildContext context, SearchViewModel viewModel) {
    var keyword = viewModel.searchController.text;
    viewModel.searchCafes(keyword);
    if (keyword.isNotEmpty) {
      viewModel.navigator(context, SearchForm(keyword: keyword));
    }
  }
}

// 검색 키워드 섹션
class SearchKeyword extends StatelessWidget {
  final String title;

  const SearchKeyword({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          CustomButtonLayout(
            borderColor: Colors.grey,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('소금빵', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
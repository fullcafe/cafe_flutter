import 'package:flutter/material.dart';
import 'package:cafe_front/views/main/search/search_form.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:provider/provider.dart';
import 'package:cafe_front/provider/main/cafe_detail/search_view_model.dart';

import '../../../models/cafe.dart';
import 'SearchBaaseCafeList.dart';


class SearchBase extends StatelessWidget {
  const SearchBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomSearchBar(),
              const SizedBox(height: 20),
              _buildSearchKeywords(),
              const SizedBox(height: 20),
              _buildPreviousVisitedCafes(context),
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return SearchBaseCafeList(
                  cafe: Cafe(
                    name: '메트로폴리스',
                    address: '서울 노원구 어쩌구',
                    phone: '02-123-4567',
                    url: '',
                    petFriendly: false,
                    wifi: true,
                    takeout: true,
                    groupFriendly: false,
                    easyPayment: false,
                    parking: true,
                    delivery: false,
                    keywords: [],
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
import 'package:cafe_front/provider/main/cafe/cafe_detail_viewmodel.dart';
import 'package:cafe_front/views/main/Cafe/cafe_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:provider/provider.dart';
import '../../../models/cafe.dart';
import '../../../provider/main/search/search_view_model.dart';
import '../../../widgets/appbar/FilterBar.dart';
import '../../../widgets/appbar/custom_appbar.dart';

enum SearchState { loading, list, map }

class SearchForm extends StatelessWidget {
  final String keyword;
  const SearchForm({Key? key, required this.keyword}) : super(key: key);

  // 검색 결과를 가져오는 함수
  Widget getContent(SearchViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.cafeResults.isEmpty) {
      return const Center(child: Text('검색 결과가 없습니다.'));
    }

    const greyStyle = TextStyle(color: CustomColors.deepGrey);

    return ListView.builder(
      itemCount: viewModel.cafeResults.length,
      itemBuilder: (context, idx) {
        Cafe cafe = viewModel.cafeResults[idx];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => CafeDetailViewModel(cafe.name),
                  child: const CafeDetailPage(),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (idx)=>
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 100,
                          child: Image.asset('assets/images/Frame ${idx%7}.png',fit: BoxFit.fill,),
                        ),
                    ),
                  ),
                ),
                Text(cafe.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 5),
                Text(cafe.address ?? '주소 없음', style: greyStyle),
                const SizedBox(height: 5),
                Text('예상평점 ★ 도보 15분', style: greyStyle),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackButtonAppBar(icons: SizedBox()),
            const CustomSearchBar(),
            FilterBar(
              onFilterApplied: (selectedFilters, booleanFilters) {
                final viewModel = context.read<SearchViewModel>();

                // 선택된 필터에서 빈 값을 제외하고 키워드로 변환
                final keywords = selectedFilters.entries
                    .where((entry) => entry.value.isNotEmpty) // 빈 값을 제외
                    .expand((entry) => entry.value) // 키워드 리스트로 변환
                    .toList();

                viewModel.searchCafesFilter(
                  keywords: keywords,
                  petFriendly: booleanFilters['petFriendly'],
                  wifi: booleanFilters['wifi'],
                  parking: booleanFilters['parking'],
                  delivery: booleanFilters['delivery'],
                ); // 필터 기반 검색
              },
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: CustomButtonLayout(
                margin: EdgeInsets.symmetric(horizontal: 10),
                borderColor: CustomColors.orange,
                backgroundColor: CustomColors.orange,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.swap_vert, color: Colors.white, size: 20),
                      Text(
                        '추천순',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: getContent(viewModel)),
          ],
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewModel>();
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
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: viewModel.searchController,
                style: const TextStyle(fontSize: 13),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '지역, 메뉴, 매장명 검색',
                  hintStyle: TextStyle(fontSize: 13, color: CustomColors.deepGrey),
                ),
                onFieldSubmitted: (value) {
                  var keyword = viewModel.searchController.text;
                  if (keyword.isNotEmpty) {
                    viewModel.searchCafes(keyword);
                  }
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              var keyword = viewModel.searchController.text;
              if (keyword.isNotEmpty) {
                viewModel.searchCafes(keyword);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 20,
              child: Image.asset('assets/icons/search_basic.png'),
            ),
          ),
        ],
      ),
    );
  }

}
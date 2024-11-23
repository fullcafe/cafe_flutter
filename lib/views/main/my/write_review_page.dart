import 'package:cafe_front/constants/colors.dart';
import 'package:cafe_front/provider/main/my/write_review_viewmodel.dart';
import 'package:cafe_front/widgets/appbar/custom_appbar.dart';
import 'package:cafe_front/widgets/button/custom_button_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteReviewPage extends StatelessWidget {
  const WriteReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const titleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);
    const keywordMargin = EdgeInsets.all(5);
    final viewModel = context.watch<WriteReviewViewModel>();

    if(viewModel.cafeDto == null){
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const BackButtonAppBar(text: '리뷰 작성하기'),
              Expanded(child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: size.height * 2.1,
                  child: Column(
                    children: [
                      // 가게 명
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 70,
                              child: Image.asset('assets/images/details/image0.jpg'),
                            ),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(viewModel.cafeDto!.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                const SizedBox(height: 10,),
                                Text(viewModel.cafeDto!.address,
                                style: const TextStyle(color: CustomColors.deepGrey,fontSize: 11),),
                              ],
                            ))
                          ],
                        ),
                      ),
                      // 이미지
                      SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(5,
                                  (idx)=> Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      width: 250,
                                      child: Image.asset('assets/images/details/image${idx % 3}.jpg',fit: BoxFit.fill,)
                                  )
                          ),
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 만족도
                      const Text('카페 만족도',style: titleStyle,),
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(5, (idx) {
                        return GestureDetector(
                          onTap: (){
                            viewModel.numOfStar = idx + 1;
                          },
                          child: SizedBox(
                              width: 50,
                              child: idx < viewModel.numOfStar? Image.asset('assets/icons/star_selected.png')  :
                              Image.asset('assets/icons/star_unselected.png')),
                        ); }
                          ),
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 누구와
                      const Text('누구와 다녀오셨나요?',style: titleStyle,),
                      SizedBox(
                        height: 60,
                        child: Column(
                          children: [
                            Expanded(child: Wrap(
                              children: List.generate(viewModel.whoList.length,
                                  (idx) => ReviewKeyword(margin: keywordMargin,keyword: viewModel.whoList[idx],selectedList: viewModel.selectedWhoList,)
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 편의 시설
                      const Text('편의시설은 어떤 게 있었나요?',style: titleStyle,),
                      SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Expanded(child: Wrap(
                              children: List.generate(viewModel.convenientList.length,
                                      (idx) => ReviewKeyword(margin: keywordMargin,keyword: viewModel.convenientList[idx],selectedList: viewModel.selectedConvenientList,)
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 목적
                      const Text('어떤 목적으로 다녀오셨나요?',style: titleStyle,),
                      SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Expanded(child: Wrap(
                              children: List.generate(viewModel.objectList.length,
                                      (idx) => ReviewKeyword(margin: keywordMargin,keyword: viewModel.objectList[idx],selectedList: viewModel.selectedObjectList,)
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      // 말씀
                      const Text('카페에 추가로 해주고픈 말씀이 있나요?',style: titleStyle,),
                      Expanded(child: TextFormField(
                        controller: viewModel.textEditingController,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: '최소 10자 이상 입력해주세요.',
                          hintStyle: TextStyle(fontSize: 12),
                          border: InputBorder.none,
                        ),
                      )),
                      GestureDetector(
                        onTap: (){
                          viewModel.writeReview();
                        },
                        child: const CustomButtonLayout(
                          backgroundColor: Colors.black,
                          height: 60,
                          width: double.infinity,
                          child: Center(child: Text('리뷰 올리기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )
      ),
    );
  }
}

class ReviewKeyword extends StatefulWidget {
  ReviewKeyword({
    Key? key,
    required this.keyword,
    required this.selectedList,
    this.selected = false,
    this.margin
  }) : super(key: key);
  final String keyword;
  bool selected;
  final EdgeInsetsGeometry? margin;
  final List<String> selectedList;

  @override
  State<ReviewKeyword> createState() => _ReviewKeywordState();
}

class _ReviewKeywordState extends State<ReviewKeyword> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WriteReviewViewModel>();
    return GestureDetector(
      onTap: (){
        if(!widget.selected){
          widget.selectedList.add(widget.keyword);
        } else {
          widget.selectedList.remove(widget.keyword);
        }
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: CustomButtonLayout(
        margin: widget.margin,
        borderColor: widget.selected? Colors.black : Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(widget.keyword,
            style: TextStyle(color: widget.selected? Colors.black : Colors.grey,
                fontWeight: widget.selected? FontWeight.bold : FontWeight.normal),),
        ),
      ),
    );
  }
}

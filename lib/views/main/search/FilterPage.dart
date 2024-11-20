import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // 필터 데이터와 선택 상태 관리
  final Map<String, List<String>> filters = {
    '누구와': ['혼자', '연인', '친구', '어른신', '어린이', '반려동물'],
    '음료': ['핸드드립', '신 커피', '고소한 커피', '디카페인', '차', '에이드', '스무디'],
    '디저트': ['티라미수', '케이크', '쿠키', '앙금', '타르트', '푸딩', '롤케이크', '크로플'],
    '목적': ['공부/작업', '데이트', 'SNS', '휴식', '브런치', '디저트 투어'],
    '편의시설': ['주차 가능', '단체석', '배달', '포장', '애완동물', '콘센트','와이파이'],
  };
  final Map<String, Set<String>> selectedFilters = {};
  bool petFriendly = false;
  bool wifi = false;
  bool parking = false;
  bool delivery = false;




  @override
  void initState() {
    super.initState();
    for (var key in filters.keys) {
      selectedFilters[key] = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('필터 검색'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, {
                'filters': selectedFilters,
                'petFriendly': petFriendly,
                'wifi': wifi,
                'parking': parking,
                'delivery': delivery,

              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...filters.keys.map((category) => buildKeywordSection(category)),
              const SizedBox(height: 30),
              const Text('편의시설', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              buildBooleanOption('반려동물 가능', petFriendly, (value) {
                setState(() => petFriendly = value);
              }),
              buildBooleanOption('Wi-Fi', wifi, (value) {
                setState(() => wifi = value);
              }),
              buildBooleanOption('주차 가능', parking, (value) {
                setState(() => parking = value);
              }),
              buildBooleanOption('배달 가능', delivery, (value) {
                setState(() => delivery = value);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _resetFilters,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                    child: const Text('필터 초기화', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: _applyFilters,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    child: const Text('적용', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKeywordSection(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: filters[category]!.map((keyword) {
              final isSelected = selectedFilters[category]!.contains(keyword);
              return GestureDetector(
                onTap: () => _toggleFilter(category, keyword),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.brown : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    keyword,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  Widget buildBooleanOption(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _toggleFilter(String category, String keyword) {
    setState(() {
      if (selectedFilters[category]!.contains(keyword)) {
        selectedFilters[category]!.remove(keyword);
      } else {
        selectedFilters[category]!.add(keyword);
      }
    });
  }

  void _resetFilters() {
    setState(() {
      for (var key in selectedFilters.keys) {
        selectedFilters[key]!.clear();
      }
    });
  }

  void _applyFilters() {
    print('적용된 필터: $selectedFilters');
    Navigator.pop(context, {
      'filters': selectedFilters,
      'petFriendly': petFriendly ?true: null,
      'wifi': wifi ?true: null,
      'parking': parking ?true: null,
      'delivery': delivery ?true: null,
    });
  }

}

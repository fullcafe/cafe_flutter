import 'package:flutter/material.dart';
import '../../provider/main/search/search_view_model.dart';
import '../../views/main/search/FilterPage.dart';
import 'package:provider/provider.dart';


class FilterBar extends StatelessWidget {
  final void Function(
      Map<String, Set<String>> filters,
      Map<String, bool?> booleanFilters,
      ) onFilterApplied;

  const FilterBar({Key? key, required this.onFilterApplied}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              final result = await Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(builder: (context) => const FilterPage()),
              );

              if (result == null) return;

                final selectedFilters = (result['filters'] as Map<String, Set<String>>?) ?? {};
                final booleanFilters = {
                  'petFriendly': result['petFriendly'] as bool?,
                  'wifi': result['wifi'] as bool?,
                  'parking': result['parking'] as bool?,
                  'delivery': result['delivery'] as bool?,
                };

                onFilterApplied(selectedFilters, booleanFilters);

            },
            child: SizedBox(
              width: 20,
              child: Image.asset('assets/icons/filter.png'),
            ),
          ),
          const Text('누구와', style: style),
          const Text('음료', style: style),
          const Text('디저트', style: style),
          const Text('목적', style: style),
          const Text('편의시설', style: style),
        ],
      ),
    );
  }
}

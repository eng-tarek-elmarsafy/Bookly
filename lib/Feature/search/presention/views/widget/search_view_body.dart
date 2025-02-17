import 'package:flutter/material.dart';
import 'custom_search.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: const [
            CustomSearch(),
            SizedBox(height: 20),
            SearchResultListView(),
          ],
        ),
      ),
    );
  }
}

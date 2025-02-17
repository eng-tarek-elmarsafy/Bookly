import 'package:bookly_app/Feature/home/presention/views/book_detalils_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presention/views/widget/cutstom_best_seller_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) => CutstomBestSellerItem(onTap: () {
          GoRouter.of(context).push(BookDetalilsView.id);
        }),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}

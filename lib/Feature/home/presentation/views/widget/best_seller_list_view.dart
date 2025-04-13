import 'package:bookly_app/Feature/home/presentation/views/book_detalils_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'cutstom_best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return CutstomBestSellerItem(
          onTap: () {
            GoRouter.of(context).push(BookDetalilsView.id);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}

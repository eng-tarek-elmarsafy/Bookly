import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/presentation/views/book_detalils_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'cutstom_best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookEntity>? books;
  const BestSellerListView({super.key, this.books});

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
            GoRouter.of(context)
                .push(BookDetalilsView.id, extra: books![index]);
          },
          book: books![index],
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

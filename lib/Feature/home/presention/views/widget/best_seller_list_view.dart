import 'package:bookly_app/Feature/home/presention/manger/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly_app/Feature/home/presention/views/book_detalils_view.dart';
import 'package:bookly_app/core/widget/custom_best_seller_loading.dart';
import 'package:bookly_app/core/widget/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cutstom_best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int index) {
              return CutstomBestSellerItem(
                onTap: () {
                  GoRouter.of(context).push(
                    BookDetalilsView.id,
                    extra: state.books[index],
                  );
                },
                book: state.books[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
          );
        } else if (state is BestSellerFailur) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return CustomBestSellerLoading();
        }
      },
    );
  }
}

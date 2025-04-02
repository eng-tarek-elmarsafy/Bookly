import 'package:bookly_app/Feature/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Feature/search/presention/manger/cubit/search_cubit.dart';
import 'package:bookly_app/core/widget/custom_best_seller_loading.dart';
import 'package:bookly_app/core/widget/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/views/widget/cutstom_best_seller_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            return ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) => CutstomBestSellerItem(
                onTap: () {
                  GoRouter.of(context)
                      .push(BookDetalilsView.id, extra: state.books[index]);
                },
                book: state.books[index],
              ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10,
              ),
            );
          } else if (state is SearchFailur) {
            return CustomErrorWidget(
              errorMessage: state.errMessage,
            );
          } else {
            return CustomBestSellerLoading();
          }
        },
      ),
    );
  }
}

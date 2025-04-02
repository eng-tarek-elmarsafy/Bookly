import 'package:bookly_app/Feature/home/presentation/manager/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app/Feature/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/core/widget/custom_error_widget.dart';
import 'package:bookly_app/core/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
      builder: (context, state) {
        if (state is RelatedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => CustomBookImage(
                onTap: () {
                  GoRouter.of(context)
                      .push(BookDetalilsView.id, extra: state.books[index]);
                },
                book: state.books[index],
              ),
            ),
          );
        } else if (state is RelatedBooksFailur) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return CustomLoadingBookImage();
        }
      },
    );
  }
}

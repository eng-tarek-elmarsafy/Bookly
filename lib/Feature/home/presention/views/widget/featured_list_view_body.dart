import 'package:bookly_app/Feature/home/presention/manger/feature_books_cubit/feature_book_cubit.dart';
import 'package:bookly_app/core/widget/custom_error_widget.dart';
import 'package:bookly_app/core/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item.dart';

class FeaturedBoosListView extends StatelessWidget {
  const FeaturedBoosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .28,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => CustomBookImage(
                book: state.books[index],
              ),
            ),
          );
        } else if (state is FeatureBookFailur) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return CustomLoadingBookImage();
        }
      },
    );
  }
}

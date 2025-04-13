import 'package:bookly_app/Feature/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'custom_list_view_item.dart';

class FeaturedBoosListView extends StatelessWidget {
  const FeaturedBoosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              if (state is FeaturedBooksLoading) {
                return LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  colors: [
                    Colors.green,
                    Colors.deepOrange,
                  ],
                );
              } else if (state is FeaturedBooksFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else if (state is FeaturedBooksSuccess) {
                return CustomBookImage(
                  book: state.books[index],
                );
              }
              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}

import 'package:bookly_app/Feature/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';

class CardBestSeller extends StatelessWidget {
  const CardBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Best Seller', style: Styles.textStyle18),
          SizedBox(height: 40),
          BestSellerListViewBlocBuilder(),
        ],
      ),
    );
  }
}

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksFailure) {
          return Text(state.errMessage);
        } else if (state is NewsetBooksLoading) {
          return LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple);
        } else if (state is NewsetBooksSuccess) {
          return BestSellerListView(books: state.books,);
        }
        return SizedBox.shrink();
      },
    );
  }
}

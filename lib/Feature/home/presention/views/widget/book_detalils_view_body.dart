import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'app_bar_book_detalils_view.dart';
import 'book_details_info.dart';
import 'books_action.dart';
import 'custom_book_detalils_image.dart';
import 'custom_list_view_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  AppBarBookDetailsView(),
                  CustomBookDetailsImage(),
                  BookDetailsInfo(),
                  Expanded(child: SizedBox(height: 37)),
                  BooksAction(),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SimilarBooksSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'You can also like',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SimilarBooksListView(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CustomBookImage(),
      ),
    );
  }
}

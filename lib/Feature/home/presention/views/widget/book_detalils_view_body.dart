import 'package:flutter/material.dart';
import 'app_bar_book_detalils_view.dart';
import 'book_details_info.dart';
import 'books_action.dart';
import 'custom_book_detalils_image.dart';
import 'similar_books_section.dart';

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
                  Expanded(child: SizedBox(height: 35)),
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

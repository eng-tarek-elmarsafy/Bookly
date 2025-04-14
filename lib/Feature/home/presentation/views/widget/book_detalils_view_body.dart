import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'app_bar_book_detalils_view.dart';
import 'book_details_info.dart';
import 'books_action.dart';
import 'custom_book_detalils_image.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;
  const BookDetailsViewBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  AppBarBookDetailsView(),
                  CustomBookDetailsImage(
                    book: book,
                  ),
                  BookDetailsInfo(),
                  Expanded(child: SizedBox(height: 35)),
                  BooksAction(),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SimilarBooksSection(
                    book: book,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

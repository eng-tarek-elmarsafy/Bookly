import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_bar_book_detalils_view.dart';
import 'book_details_info.dart';
import 'books_action.dart';
import 'custom_book_detalils_image.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;
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
                  const AppBarBookDetailsView(),
                  CustomBookDetailsImage(
                    book: book,
                  ),
                  BookDetailsInfo(
                    book: book,
                  ),
                  const Expanded(child: SizedBox(height: 35)),
                  BooksAction(
                    book: book,
                    onPressed: () async {
                      if (book.volumeInfo?.previewLink != null) {
                        final Uri uri =
                            Uri.parse(book.volumeInfo!.previewLink!);
                        launchUrl(uri);
                      }
                    },
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  const SimilarBooksSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

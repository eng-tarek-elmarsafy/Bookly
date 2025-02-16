import 'package:flutter/material.dart';
import 'app_bar_book_detalils_view.dart';
import 'book_details_info.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_detalils_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarBookDetailsView(),
            CustomBookDetailsImage(),
            BookDetailsInfo(),
            SizedBox(height: 18),
            BookRating(),
            SizedBox(height: 37),
            BooksAction(),
          ],
        ),
      ),
    );
  }
}

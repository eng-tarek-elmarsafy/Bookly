import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class CustomBookDetailsImage extends StatelessWidget {
  final BookModel book;
  const CustomBookDetailsImage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final double widthOfScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthOfScreen * .25),
      child: CustomBookImage(
        book: book,
      ),
    );
  }
}

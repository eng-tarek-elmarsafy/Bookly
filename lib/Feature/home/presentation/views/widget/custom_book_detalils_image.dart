import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class CustomBookDetailsImage extends StatelessWidget {
  final BookEntity book;
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

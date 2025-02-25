import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.book});
  final BookModel? book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  book?.volumeInfo!.imageLinks!.thumbnail ?? AssetsData.test),
            ),
          ),
        ),
      ),
    );
  }
}

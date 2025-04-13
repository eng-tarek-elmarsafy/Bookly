import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final BookEntity? book;
  const CustomBookImage({super.key,  this.book});

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
              image: NetworkImage(book!.image),
            ),
          ),
        ),
      ),
    );
  }
}

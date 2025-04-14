import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  final BookEntity book;
  const SimilarBooksListView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CustomBookImage(book: book,),
      ),
    );
  }
}

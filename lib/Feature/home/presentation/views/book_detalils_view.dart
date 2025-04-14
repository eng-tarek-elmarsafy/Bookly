import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'widget/book_detalils_view_body.dart';

class BookDetalilsView extends StatelessWidget {
  final BookEntity book;
  static const String id = '/BookDetalilsView';
  const BookDetalilsView({super.key,  required this.book});

  @override
  Widget build(BuildContext context) {
    return BookDetailsViewBody(book: book,);
  }
}

import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/Feature/home/presention/manger/related_books_cubit/related_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/book_detalils_view_body.dart';

class BookDetalilsView extends StatefulWidget {
  final BookModel book;
  static const String id = '/BookDetalilsView';

  const BookDetalilsView({super.key, required this.book});

  @override
  State<BookDetalilsView> createState() => _BookDetalilsViewState();
}

class _BookDetalilsViewState extends State<BookDetalilsView> {
  @override
  void initState() {
    BlocProvider.of<RelatedBooksCubit>(context)
        .fetchRelatedBooks(type:'Books' );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BookDetailsViewBody(
      book: widget.book,
    );
  }
}

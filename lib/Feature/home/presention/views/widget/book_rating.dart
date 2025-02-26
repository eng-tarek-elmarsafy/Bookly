import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.book});
  final BookModel? book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0xffffdd4f),
          size: 14,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '8.4',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '(2990)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}

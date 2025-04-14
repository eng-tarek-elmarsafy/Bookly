import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final BookEntity? book;
  const BookRating({super.key, this.book});

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
          book?.rating ?? '',
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
            '(90094)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}

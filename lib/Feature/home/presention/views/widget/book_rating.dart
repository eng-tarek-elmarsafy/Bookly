import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0xffffdd4f),
          size: 20,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '8.4',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '(2990)',
          style: Styles.textStyle14.copyWith(
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}

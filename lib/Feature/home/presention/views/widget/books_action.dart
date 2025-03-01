import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widget/custom_button.dart';

class BooksAction extends StatelessWidget {
  final BookModel book;
  final VoidCallback onPressed;
  const BooksAction({super.key, required this.book, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: price(),
              textColor: Colors.black,
              onPressed: onPressed,
            ),
          ),
          Expanded(
            child: CustomButton(
              backgroundColor: Color(0xffef8263),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              text: 'Free preview',
              textSize: 16,
              textColor: Colors.black,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }

  String price() {
    if (book.saleInfo?.listPrice?.amount == null) {
      return 'Free';
    } else {
      return "${book.saleInfo!.listPrice!.amount} EGP";
    }
  }
}

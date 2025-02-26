import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:flutter/material.dart';
import '../../../../../constns.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class CutstomBestSellerItem extends StatelessWidget {
  final VoidCallback onTap;
  final BookModel? book;
  const CutstomBestSellerItem({super.key, required this.onTap, this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                //image
                child: Image.network(
                  book?.volumeInfo!.imageLinks!.smallThumbnail ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  //title
                  child: Text(
                    book?.volumeInfo!.title ?? '',
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGtSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                //authors
                Text(
                  book?.volumeInfo!.authors![0] ?? '',
                  style: Styles.textStyle14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    //Price
                    book?.saleInfo!.listPrice != null
                        ? Text(
                            "${book?.saleInfo!.listPrice!.amount} EGP",
                            style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Free',
                            style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    const Spacer(),
                    BookRating(
                      book: book,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.book});
  final BookModel? book;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              return Center(
                child: Icon(
                  Icons.error,
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            imageUrl: book?.volumeInfo!.imageLinks!.thumbnail ?? '',
          ),
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 8),
    //   child: AspectRatio(
    //     aspectRatio: 2.6 / 4,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(16),
    //         image: DecorationImage(
    //           fit: BoxFit.fill,
    //           image: NetworkImage(
    //             book?.volumeInfo!.imageLinks!.thumbnail ?? AssetsData.test,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

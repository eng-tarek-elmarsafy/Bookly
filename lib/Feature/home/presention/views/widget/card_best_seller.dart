import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';

class CardBestSeller extends StatelessWidget {
  const CardBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Best Seller', style: Styles.textStyle18),
          SizedBox(height: 40),
          BestSellerListView(),
        ],
      ),
    );
  }
}

import 'package:bookly_app/Feature/home/presention/views/widget/card_best_seller.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'featured_list_view_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(),
          const FeaturedBoosListView(),
          const SizedBox(height: 50),
          const CardBestSeller(),
        ],
      ),
    );
  }
}

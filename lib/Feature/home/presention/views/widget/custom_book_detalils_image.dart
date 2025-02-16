import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthOfScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthOfScreen * .2),
      child: const CustomBookImage(),
    );
  }
}

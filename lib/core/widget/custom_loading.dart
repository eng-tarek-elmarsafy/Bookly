import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingBookImage extends StatelessWidget {
  const CustomLoadingBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Skeletonizer(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .28,
                  width: MediaQuery.of(context).size.width * .30,
                  child: Image.asset(
                    AssetsData.logo,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );

    // Center(child: CircularProgressIndicator());
  }
}

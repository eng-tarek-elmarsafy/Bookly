import 'package:bookly_app/Feature/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Feature/home/presention/manger/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly_app/Feature/home/presention/manger/feature_books_cubit/feature_book_cubit.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              BestSellerCubit(getIt.get<HomeRepoImp>())..fetchBestSellerBooks(),
        ),
        RepositoryProvider(
          create: (context) =>
              FeatureBookCubit(getIt.get<HomeRepoImp>())..fetchFeaturedBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100b30),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
        // home: SplashView(),
      ),
    );
  }
}

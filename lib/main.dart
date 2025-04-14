import 'package:bookly_app/Feature/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/domain/ues_case/fetch_featured_books_use_case.dart';
import 'package:bookly_app/Feature/home/domain/ues_case/fetch_newset_books_use_case.dart';
import 'package:bookly_app/Feature/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Feature/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/constns.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/function/serves_locator.dart';
import 'package:bookly_app/core/utils/observer/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeatureBox);
  await Hive.openBox<BookEntity>(kNewsBox);
  setupServesLocator();
  Bloc.observer = SBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImp>(),
            ),
          )..featuredBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            FetchNewsetBooksUseCase(
              homeRepo: getIt.get<HomeRepoImp>(),
            ),
          )..fetchNewsetBooks(),
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

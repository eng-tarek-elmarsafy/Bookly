import 'package:bookly_app/Feature/home/data/models/book_model/book.models.dart';
import 'package:bookly_app/Feature/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Feature/home/presentation/manager/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app/Feature/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Feature/home/presentation/views/home_view.dart';
import 'package:bookly_app/Feature/search/data/repo/search_repo_imp.dart';
import 'package:bookly_app/Feature/search/presention/manger/cubit/search_cubit.dart';
import 'package:bookly_app/Feature/search/presention/views/search_view.dart';
import 'package:bookly_app/Feature/splash/presention/views/splash_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: HomeView.id,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: BookDetalilsView.id,
        builder: (context, state) => BlocProvider(
          create: (context) => RelatedBooksCubit(getIt.get<HomeRepoImp>()),
          child: BookDetalilsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: SearchView.id,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImp>()),
          child: SearchView(),
        ),
      ),
    ],
  );
}

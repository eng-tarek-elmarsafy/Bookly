import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Feature/home/presentation/views/book_detalils_view.dart';
import 'package:bookly_app/Feature/home/presentation/views/home_view.dart';
import 'package:bookly_app/Feature/search/presention/views/search_view.dart';
import 'package:bookly_app/Feature/splash/presention/views/splash_view.dart';
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
        builder: (context, state) => BookDetalilsView(
          book: state.extra as BookEntity,
        ),
      ),
      GoRoute(
        path: SearchView.id,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}

import 'package:bookly_app/Feature/home/presention/views/home_view.dart';
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
    ],
  );
}

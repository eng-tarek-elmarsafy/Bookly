import 'package:bookly_app/Feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constns.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeatureBox);
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff100b30),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      debugShowCheckedModeBanner: false,
      // home: SplashView(),
    );
  }
}

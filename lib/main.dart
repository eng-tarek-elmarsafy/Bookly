import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'Feature/splash/presention/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff100b30),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

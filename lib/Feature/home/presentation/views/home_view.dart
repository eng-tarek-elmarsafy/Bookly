import 'package:flutter/material.dart';
import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String id = '/HomeView';
  const HomeView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}

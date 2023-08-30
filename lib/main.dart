import 'package:flutter/material.dart';
import 'package:intro_view/views/home_view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/onboarding_view/onboarding_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final showHome = pref.getBool('showHome') ?? false;
  runApp(IntroView(showHome: showHome));
}

class IntroView extends StatelessWidget {
  final bool showHome;
  const IntroView({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome ? const HomePageView() : const OnBoardingPage(),
    );
  }
}

import 'package:flutter/material.dart';

import 'onboarding_view/onboarding_page_view.dart';

void main() {
  runApp(const IntroView());
}

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

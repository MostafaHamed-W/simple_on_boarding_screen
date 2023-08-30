import 'package:flutter/material.dart';
import 'package:intro_view/onboarding_view/widgets/custom_onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: pageController,
          children: const [
            CustomOnBoardingPage(
              title: 'Manage',
              subTitle:
                  'Manage the process of the tasks completion,\ntrack the time and analyze the status',
              image: 'assets/images/1.png',
            ),
            CustomOnBoardingPage(
              title: 'Share',
              subTitle:
                  'Share the tasks and updates with your team,\nconvenienty for hightr productivity',
              image: 'assets/images/3.png',
            ),
            CustomOnBoardingPage(
              title: 'Keep',
              subTitle: 'Keep various ways to contact and get in touch,\neasly right from the app',
              image: 'assets/images/4.png',
            ),
            CustomOnBoardingPage(
              title: 'Participate',
              subTitle:
                  'Participate with your opinion and special ideas,\nkeep in touch with the project',
              image: 'assets/images/2.png',
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                skipMethod();
              },
              child: const Text('Skip', style: TextStyle(fontSize: 20)),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: const WormEffect(activeDotColor: Colors.blue),
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            TextButton(
              onPressed: () {
                nextMethod();
              },
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextMethod() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void skipMethod() {
    pageController.animateToPage(
      3,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}

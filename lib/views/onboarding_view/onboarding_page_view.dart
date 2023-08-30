import 'package:flutter/material.dart';
import 'package:intro_view/views/home_view/home_view.dart';
import 'package:intro_view/views/onboarding_view/widgets/custom_onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController pageController = PageController();
  bool isLastPage = false;
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
          onPageChanged: (index) {
            setState(() => isLastPage = index == 3);
          },
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
                  'Participate and get involved in application aspects,\ntaking part or engaging in an activity',
              image: 'assets/images/2.png',
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        child: isLastPage
            ? TextButton(
                onPressed: () async {
                  //to make it only one time at frist time installing app
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  //navigate to home page
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePageView(),
                  ));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(80),
                ),
                child: const Text(
                  'GetStarted',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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

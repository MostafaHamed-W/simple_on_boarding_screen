import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding_view/onboarding_page_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              pref.setBool('showHome', false);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const OnBoardingPage(),
              ));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const SafeArea(
          child: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 50,
            color: Colors.blue,
          ),
        ),
      )),
    );
  }
}

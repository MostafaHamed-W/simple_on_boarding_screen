import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
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

import 'package:flutter/material.dart';

class CustomOnBoardingPage extends StatelessWidget {
  const CustomOnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // border: Border.all(width: 2, color: Colors.blue),
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: 'Walkway'),
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

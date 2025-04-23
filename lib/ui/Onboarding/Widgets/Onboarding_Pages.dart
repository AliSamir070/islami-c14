import 'package:flutter/material.dart';
import 'package:islami_c14/model/OnboardinfModel.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/style/Methods.dart';

class OnboardingPages extends StatelessWidget {
  OnboardingModel onboarding;

  OnboardingPages({required this.onboarding});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            onboarding.image,
            width: calculateWidth(398, screenWidth),
            height: calculateHeight(415, screenHeight),
          ),
          Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.primary,
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          Text(
            onboarding.content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.primary,
                fontWeight: FontWeight.w700,
                fontSize: onboarding.title == '' ? 24 : 20),
          ),
        ],
      ),
    );
  }
}

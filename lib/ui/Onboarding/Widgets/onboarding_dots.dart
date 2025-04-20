import 'package:flutter/material.dart';
import 'package:islami_c14/style/ColorManager.dart';

class OnboardingDots extends StatelessWidget {
  int current;
  int dotNumber;

  OnboardingDots({required this.dotNumber, required this.current});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: dotNumber!=current? 7:18,
      decoration: BoxDecoration(
        color: dotNumber!=current?Color(0xff707070):ColorManager.primary,
        borderRadius: BorderRadius.circular(27),
      ),
    );
  }
}

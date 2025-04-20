import 'package:flutter/material.dart';
import 'package:islami_c14/core/constants/app_fonts.dart';
import 'package:islami_c14/ui/on_boarding/data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoardingData});
  final OnBoardingModel onBoardingData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(
            onBoardingData.image,
            width: 398,
            height: 415,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 39.75,),
          Text(
            onBoardingData.title,
            style: AppFonts.fontSize24Bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.25,),
          if(onBoardingData.subTitle != null) Text(
            onBoardingData.subTitle!,
            style: AppFonts.fontSize20Bold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
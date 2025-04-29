import 'package:flutter/material.dart';
import 'package:islami_c14/model/on_boarding_model.dart';
import 'package:islami_c14/style/ColorManager.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(child: Image.asset(model.imagePath)),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorManager.primary,
          ),
        ),
        model.description == null
            ? const SizedBox(height: 16)
            : Text(
                model.description!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary,
                ),
              ),
        const SizedBox(height: 16)
      ],
    );
  }
}

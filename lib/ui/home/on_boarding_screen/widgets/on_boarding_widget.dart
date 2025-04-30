import 'package:flutter/material.dart';
import 'package:islami_c14/style/ColorManager.dart';


class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget(
      {super.key, required this.title, required this.image, this.description, });
  final String title;
  final String image;
  final String? description;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            description ?? "",
            style: TextStyle(
                color: ColorManager.primary,
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
        ),

      ],
    );
  }
}

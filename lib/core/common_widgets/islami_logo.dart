import 'package:flutter/material.dart';
import 'package:islami_c14/core/constants/app_images.dart';

class IslamiLogo extends StatelessWidget {
  const IslamiLogo({
    super.key, this.logoWidth, this.logoHeight,
  });
  final double? logoWidth;
  final double? logoHeight;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.islamiMosqueLogo,
        width: logoWidth ?? 299,
        height: logoHeight?? 141,
        fit: BoxFit.cover,
      ),
    );
  }
}
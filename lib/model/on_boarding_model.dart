import 'package:islami_c14/style/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String? description;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnBoardingModel> onBoardingContent = [
    OnBoardingModel(
      imagePath: AppAssets.onBoarding1,
      title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_c14/model/on_boarding_model.dart';
import 'package:islami_c14/style/AppConstants.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/style/PrefsManager.dart';
import 'package:islami_c14/style/app_assets.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/on_boarding/widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoardingScreen";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.logo, width: width * .8),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                itemBuilder: (context, index) => OnBoardingItem(
                  model: OnBoardingModel.onBoardingContent[index],
                ),
                itemCount: OnBoardingModel.onBoardingContent.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? const SizedBox(width: 64)
                      : TextButton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                  DotsIndicator(
                    dotsCount: OnBoardingModel.onBoardingContent.length,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: ColorManager.primary,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (currentIndex == 4) {
                        await PrefsManager.saveBool(
                          AppConstants.isFirstTime,
                          false,
                        );
                        Navigator.pushReplacementNamed(
                          // ignore: use_build_context_synchronously
                          context,
                          HomeScreen.routeName,
                        );
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == 4 ? "Finish" : 'Next',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

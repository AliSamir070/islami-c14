import 'package:flutter/material.dart';
import 'package:islami_c14/model/OnboardinfModel.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/style/Methods.dart';
import 'package:islami_c14/style/PrefsManager.dart';
import 'package:islami_c14/ui/Onboarding/Widgets/Onboarding_Pages.dart';
import 'package:islami_c14/ui/home/home_screen.dart';

import 'Widgets/onboarding_dots.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'Onboarding';

  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
        image: 'assets/images/Onboarding1.png',
        content: 'Welcome To Islmi App'),
    OnboardingModel(
        image: 'assets/images/Onboarding2.png',
        content: 'We Are Very Excited To Have You In Our Community',
        title: 'Welcome To Islami'),
    OnboardingModel(
        image: 'assets/images/Onboarding3.png',
        content: 'Read, and your Lord is the Most Generous  ',
        title: 'Reading the Quran'),
    OnboardingModel(
        image: 'assets/images/Onboarding4.png',
        content: 'Praise the name of your Lord, the Most High',
        title: 'Bearish'),
    OnboardingModel(
        image: 'assets/images/Onboarding5.png',
        content:
            'You can listen to the Holy Quran Radio through the application for free and easily',
        title: 'Holy Quran Radio'),
  ];

  int currentPage = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/islami.png',
              width: calculateWidth(291, screenWidth),
            ),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (val) {
                  setState(() {
                    currentPage = val;
                  });
                },
                itemBuilder: (context, index) => OnboardingPages(
                  onboarding: onboardingPages[index],
                ),
                itemCount: onboardingPages.length,
                controller: pageController,
              ),
            ),
            Row(
              children: [
                Visibility(
                  maintainSize: true,
                  maintainState: true,
                  maintainSemantics: true,
                  maintainAnimation: true,
                  visible: currentPage == 0 ? false : true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.blackColor,
                      ),
                      onPressed: () {
                        pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )),
                ),
                Expanded(
                    child: Row(
                      spacing: 11,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnboardingDots(current: currentPage,dotNumber: 0,),
                    OnboardingDots(current: currentPage,dotNumber: 1,),
                    OnboardingDots(current: currentPage,dotNumber: 2,),
                    OnboardingDots(current: currentPage,dotNumber: 3,),
                    OnboardingDots(current: currentPage,dotNumber: 4,),

                  ],
                )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.blackColor,
                    ),
                    onPressed: () {
                      if(currentPage == 4){
                        PrefsManager.onboardingFirstTime();
                        Navigator.pushNamed(context, HomeScreen.routeName);

                      }else{
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }
                    },
                    child: Text(
                      currentPage != 4 ? 'Next' : 'Finish',
                      style: TextStyle(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

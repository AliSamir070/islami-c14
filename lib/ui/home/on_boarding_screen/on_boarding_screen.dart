import 'package:flutter/material.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/home/on_boarding_screen/widgets/dot_indictor.dart';
import 'package:islami_c14/ui/home/on_boarding_screen/widgets/on_boarding_widget.dart';

import '../../../model/onbording_data.dart';
import '../../../style/ColorManager.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "on boarding";
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/images/islami.png"),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: OnBoardingData.onBoardingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                var item = OnBoardingData.onBoardingList[index];
                return OnBoardingWidget(
                  image: item.imagePath,
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      },
                      child: Text(
                        currentIndex > 0 ? "Back" : "",
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex ==
                            OnBoardingData.onBoardingList.length - 1) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        } else {
                          controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      },
                      child: Text(
                        currentIndex == OnBoardingData.onBoardingList.length - 1
                            ? "Finish"
                            : "Next",
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnBoardingData.onBoardingList.length,
                  (index) => DotIndicator(isActive: currentIndex == index),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

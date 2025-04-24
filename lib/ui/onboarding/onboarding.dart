import 'package:flutter/material.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'datacalss.dart';


class OnBoardingScreen extends StatefulWidget {

  static const String routeName = "OnBoarding";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}



class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;

  final List<OnBoardingPageModel> pages = [
    OnBoardingPageModel(
      image: "assets/images/Frame1.png",
      title: "Welcome To Islami App",
      subtitle: "",
    ),
    OnBoardingPageModel(
      image: "assets/images/Frame2.png",
      title: "Welcome To Islami",
      subtitle: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingPageModel(
      image: "assets/images/Frame3.png",
      title: "Reading the Quran",
      subtitle: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingPageModel(
      image: "assets/images/Frame4.png",
      title: "Bearish",
      subtitle: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingPageModel(
      image: "assets/images/Frame5.png",
      title: "Holy Quran Radio",
      subtitle: "You can listen to the Holy Quran Radio for free and easily",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == pages.length - 1;
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/islami.png",
                        width: 299,
                        height: 141,
                      ),
                      Image.asset(page.image, height: 300),
                      const SizedBox(height: 30),
                      Text(
                        page.title,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        page.subtitle,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLastPage)
                  TextButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Back", style: TextStyle(color:ColorManager.primary)),
                  ),
                Spacer(),
                for (int index = 0; index < pages.length; index++)
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: currentPage == index ? 18 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: currentPage == index ? ColorManager.primary : Colors.white24,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.of(context).pushNamed("home");
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? "Finish" : "Next",
                    style: TextStyle(color:ColorManager.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c14/core/constants/app_data/app_data.dart';
import 'package:islami_c14/core/constants/app_fonts.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/ui/on_boarding/presentation/views_model/on_boarding_cubit.dart';
import 'package:islami_c14/ui/on_boarding/presentation/views_model/on_boarding_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageViewFooter extends StatelessWidget {
  const OnBoardingPageViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<OnBoardingCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<OnBoardingCubit,OnBoardingState>(
        builder: (context, state) => Row(
          children: [
            controller.currentPageIndex != 0.0? GestureDetector(
              onTap: (){
                controller.moveToPreviousPage();
              },
              child: const Text(
                "Back",
                style: AppFonts.fontSize16Bold,
              ),
            ):
            SizedBox(width: 40,),
            Expanded(
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller.onBoardingPageController,
                  count:  AppData.onBoardingList.length,
                  effect: const WormEffect(
                      dotHeight: 7,
                      dotWidth:  18,
                      activeDotColor: ColorManager.primary,
                      radius: 27,
                      dotColor: ColorManager.gray,
                      spacing: 11
                  ),
                  onDotClicked: (index){
                    controller.moveToSelectedPage(index: index);
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                controller.currentPageIndex == 4?
                 controller.finishButton(context: context)
                : controller.moveToNextPage();
              },
              child: Text(
                controller.currentPageIndex == 4? "Finish" : "Next",
                style: AppFonts.fontSize16Bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
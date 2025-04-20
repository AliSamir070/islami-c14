import 'package:flutter/material.dart';
import 'package:islami_c14/core/common_widgets/islami_logo.dart';
import 'package:islami_c14/ui/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:islami_c14/ui/on_boarding/presentation/views/widgets/on_boarding_page_view_footer.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          IslamiLogo(logoHeight: 171,logoWidth: 291,),
          Expanded(child: OnBoardingPageView()),
          OnBoardingPageViewFooter(),
        ],
      ),
    );
  }
}
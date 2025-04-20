import 'package:flutter/material.dart';
import 'package:islami_c14/core/common_widgets/islami_logo.dart';
import 'package:islami_c14/core/constants/app_fonts.dart';
import 'package:islami_c14/ui/home/tabs/sebha_tab/presentation/views/widgets/sebha_content.dart';

class SebhaTabBody extends StatelessWidget {
  const SebhaTabBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        IslamiLogo(),
        SizedBox(height: 16,),
        Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppFonts.fontSize36Bold,
        ),
        SizedBox(height: 8,),
        SebhaContent()
      ],
    );
  }
}

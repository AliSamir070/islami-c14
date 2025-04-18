import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c14/model/HadethModel.dart';

import '../../style/ColorManager.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: ColorManager.primary
        ),
        title: Text(
          "Hadith ${hadeth.number}",
          style: TextStyle(
              color: ColorManager.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 18
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/left_corner.png",
                      height: 92,
                        width: 92,
                      ),
                      Expanded(
                        child: Text(hadeth.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                      Image.asset("assets/images/right_corner.png", height: 92,
                        width: 92,),
                    ],
                  ),
                  Expanded(
                    child:Text(hadeth.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset("assets/images/mosque.png")
        ],
      ),
    );
  }
}

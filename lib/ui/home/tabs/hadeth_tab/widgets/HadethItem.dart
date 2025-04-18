import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c14/style/ColorManager.dart';

import '../../../../../model/HadethModel.dart';

class HadethItem extends StatelessWidget {
  int index;
  int selectedIndex;
  HadethModel hadethModel;
  HadethItem({required this.index, required this.selectedIndex,required this.hadethModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(
        right: 16,
        top: index != selectedIndex ?20:0,
        bottom: index != selectedIndex ?20:0
      ),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),

              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/left_corner_hadith.png",
                        height:70 ,
                        width:70 ,
                      ),
                      Expanded(
                        child: Text(hadethModel.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          color: ColorManager.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                        ),),
                      ),
                      Image.asset("assets/images/right_corner_hadith.png",
                        height:70 ,
                        width:70 ,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                     children: [
                       Image.asset("assets/images/hadith_item_back.png"),
                       Text(hadethModel.content,
                         textAlign: TextAlign.center,
                         maxLines: 12,
                         textDirection: TextDirection.rtl,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w700,
                           color: ColorManager.blackColor
                         ),

                       )
                     ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset("assets/images/mosque_hadeth.png")
        ],
      ),
    );
  }
}

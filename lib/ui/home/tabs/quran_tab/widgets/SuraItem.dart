import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c14/model/SuraModel.dart';
import 'package:islami_c14/style/Methods.dart';
import 'package:islami_c14/ui/quran_details/quran_details_screen.dart';

class SuraItem extends StatelessWidget {
  SuraModel suraModel;
  SuraItem(this.suraModel);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, QuranDetailsScreen.routeName,arguments: suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset("assets/images/hexagonal.svg",
              height: calculateHeight(64, screenHeight),
              width: calculateWidth(64, screenWidth),
              ),
              Text(
                suraModel.suraNumber.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),
              )
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
                Text("${suraModel.versesNumber} Verses",style: TextStyle(
                    color: Colors.white,
                    fontSize:14,
                    fontWeight: FontWeight.w700
                )),
              ],
            ),
          ),
          Text(suraModel.suraNameAr,style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),),
        ],
      ),
    );
  }
}

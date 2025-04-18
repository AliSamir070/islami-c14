import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c14/model/SuraModel.dart';
import 'package:islami_c14/style/ColorManager.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = "QuranDetails";

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadFile(suraModel.suraNumber);
    }// non blocking
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorManager.primary
        ),
        title: Text(
          suraModel.suraNameEn,
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
                      Image.asset("assets/images/left_corner.png"),
                      Text(suraModel.suraNameAr,style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w700
                      ),),
                      Image.asset("assets/images/right_corner.png"),
                    ],
                  ),
                  Expanded(
                    child:verses.isEmpty
                          ?Center(
                            child: CircularProgressIndicator(
                                                  color: ColorManager.primary,
                                                ),
                          )
                          :Text(verses,
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

  String verses = "";

  loadFile(int suraNumber)async{
    String sura = await rootBundle.loadString("assets/files/${suraNumber}.txt");// non blocking
    List<String> suraLines = sura.split("\n");

    for(int i=0;i<suraLines.length;i++){
      verses= verses + suraLines[i];
      verses+="(${i+1})";
    }
    print(verses);
    setState(() {

    });

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c14/style/AppConstants.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/style/Methods.dart';
import 'package:islami_c14/style/PrefsManager.dart';
import 'package:islami_c14/ui/home/tabs/quran_tab/widgets/RecentlyItem.dart';
import 'package:islami_c14/ui/home/tabs/quran_tab/widgets/SuraItem.dart';

import '../../../../model/SuraModel.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";
  List<SuraModel> searchSurasList = [];
  List<SuraModel> mostRecently = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostRecently = PrefsManager.getMostRecently();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenHeight);
    print(screenWidth);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/quran_back.png")
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset("assets/images/islami.png",
              width: 299,
              height: 141,
            ),
            SizedBox(height: 21,),
            TextField(
              cursorColor: ColorManager.primary,
              onChanged: (value){
                setState(() {
                  searchText = value;
                  searchSura();
                });
              },
              style:TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
              ) ,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset("assets/images/quran.svg",
                    colorFilter: ColorFilter.mode(
                        ColorManager.primary,
                        BlendMode.srcIn),
                  ),
                ),
                hintText: "Sura name",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorManager.primary
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: ColorManager.primary
                    )
                )
              ),
            ),
            Visibility(
              visible: searchText.isEmpty,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("Most Recently ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: calculateHeight(150, screenHeight),
                    child: mostRecently.isEmpty
                        ?const Center(
                          child: Text("No Recently items",style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                                              ),),
                        )
                        :ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, index) => RecentlyItem(
                          mostRecently[index]
                        ),
                        separatorBuilder: (context, index) => SizedBox(width: 10,),
                        itemCount: mostRecently.length
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("Suras List",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => SuraItem(
                      suraModel:searchText.isNotEmpty
                          ?searchSurasList[index]
                          :AppConstants.surasList[index],
                      onPress:(){
                        SuraModel newSura = searchText.isNotEmpty
                            ?searchSurasList[index]
                            :AppConstants.surasList[index];
                        if(!mostRecently.contains(newSura)){
                          mostRecently.insert(0, newSura);
                        }else{
                          mostRecently.remove(newSura);
                          mostRecently.insert(0, newSura);
                        }
                        PrefsManager.saveMostRecently(mostRecently);
                        setState(() {

                        });
                      }
                  ),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 44
                    ),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  itemCount: searchText.isNotEmpty
                      ?searchSurasList.length
                      :AppConstants.surasList.length
              ),
            )
          ],
        ),
      ),
    );
  }
  searchSura(){
    if(searchText.isNotEmpty){
      searchSurasList = [];
      for(int i=0;i<AppConstants.surasList.length;i++){
        if(AppConstants.surasList[i].suraNameAr.contains(searchText)
        || AppConstants.surasList[i].suraNameEn.contains(searchText) ){
          searchSurasList.add(AppConstants.surasList[i]);
        }
      }
    }
  }
}

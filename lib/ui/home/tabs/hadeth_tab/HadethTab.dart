import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c14/model/HadethModel.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/ui/home/tabs/hadeth_tab/widgets/HadethItem.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  PageController controller = PageController(viewportFraction: 0.8);

  int selected = 0;

  @override
  void initState() {
    super.initState();
    loadFiles();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      color: ColorManager.blackColor,
      child: Stack(
        children: [
          Image.asset("assets/images/hadeth_back.png"),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20
            ),
            child: Column(
              children: [
                Image.asset("assets/images/islami.png",
                  width: 299,
                  height: 141,
                ),
                SizedBox(height: 30,),
                Expanded(
                    child: allAhadeth.isEmpty
                        ?const Center(child: CircularProgressIndicator(color: ColorManager.primary,),)
                        :PageView.builder(
                      controller: controller,
                      onPageChanged: (index){
                        selected = index;
                        setState(() {

                        });
                      },
                      itemBuilder: (context, index) => HadethItem(
                        selectedIndex: selected,
                        index: index,
                        hadethModel:allAhadeth[index] ,
                      ),
                      itemCount: allAhadeth.length,
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  List<HadethModel> allAhadeth = [];
  loadFiles()async{
    for(int i=1 ; i<=50;i++){
      String hadeth = await rootBundle.loadString("assets/files/h$i.txt");
      List<String> lines = hadeth.split("\n");
      String hadethName = lines[0];
      lines.removeAt(0);
      String hadethContent = lines.join(" ");
      allAhadeth.add(HadethModel(
          name: hadethName,
          content: hadethContent,
          number: i));
    }
    print("Read all files successfully");
    setState(() {

    });

  }
}
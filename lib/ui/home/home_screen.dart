import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/ui/home/tabs/hadeth_tab/HadethTab.dart';
import 'package:islami_c14/ui/home/tabs/quran_tab/QuranTab.dart';
import 'package:islami_c14/ui/home/tabs/radio_tab/RadioTab.dart';
import 'package:islami_c14/ui/home/tabs/sebha_tab/presentation/views/sebha_tab.dart';
import 'package:islami_c14/ui/home/tabs/time_tab/TimeTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  List<Widget> tabs = [
    const QuranTab(),
    HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(

        backgroundColor: ColorManager.primary,
          indicatorColor: ColorManager.blackColor.withOpacity(0.6),
          labelBehavior:NavigationDestinationLabelBehavior.onlyShowSelected ,
          selectedIndex: selected,
          onDestinationSelected: (index){
            setState(() {
              selected = index;
            });
          },
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset("assets/images/quran.svg"),
                selectedIcon: SvgPicture.asset("assets/images/quran_selected.svg"),
                label: "Quran",
            ),
            NavigationDestination(
                icon: SvgPicture.asset("assets/images/hadeth.svg"),
                selectedIcon: SvgPicture.asset("assets/images/hadeth_selected.svg"),
                label: "Hadeth"
            ),
            NavigationDestination(
                icon: SvgPicture.asset("assets/images/sebha.svg"),
                selectedIcon: SvgPicture.asset("assets/images/sebha_selected.svg"),
                label: "Sebha"
            ),
            NavigationDestination(
                icon: SvgPicture.asset("assets/images/radio.svg"),
                selectedIcon: SvgPicture.asset("assets/images/radio_selected.svg"),
                label: "Radio"
            ),
            NavigationDestination(
                icon: SvgPicture.asset("assets/images/time.svg"),
                selectedIcon: SvgPicture.asset("assets/images/time_selected.svg"),
                label: "Time"
            )
          ]
      ),
      body:tabs[selected] ,
    );
  }
}

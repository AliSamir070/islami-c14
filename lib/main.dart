import 'package:flutter/material.dart';
import 'package:islami_c14/style/AppConstants.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/style/PrefsManager.dart';
import 'package:islami_c14/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_c14/ui/quran_details/quran_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.blackColor,
        navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateTextStyle.resolveWith((states) =>
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        OnBoardingScreen.routeName: (_) => const OnBoardingScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
        QuranDetailsScreen.routeName: (_) => QuranDetailsScreen()
      },
      initialRoute: PrefsManager.getBool(AppConstants.isFirstTime) == null
          ? OnBoardingScreen.routeName
          : HomeScreen.routeName,
    );
  }
}

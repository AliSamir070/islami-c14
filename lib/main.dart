import 'package:flutter/material.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/home/tabs/SebhaTab.dart';
import 'package:islami_c14/ui/onboarding/onboarding.dart';


void main() {
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
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateTextStyle.resolveWith(
                  (states) => TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  )
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        OnBoardingScreen.routeName:(_)=>OnBoardingScreen(),
        SebhaTab.routeName:(_)=>SebhaTab(),
      },
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}

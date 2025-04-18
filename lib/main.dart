import 'package:flutter/material.dart';
import 'package:islami_c14/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/quran_details/quran_details_screen.dart';

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
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
        QuranDetailsScreen.routeName:(_)=>QuranDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

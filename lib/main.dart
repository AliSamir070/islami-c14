import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/style/PrefsManager.dart';
import 'package:islami_c14/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/on_boarding/presentation/views_model/on_boarding_cubit.dart';
import 'package:islami_c14/ui/quran_details/quran_details_screen.dart';

import 'ui/on_boarding/presentation/views/on_boarding_view.dart';

void main() async{
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
        fontFamily: "Janna LT",
        scaffoldBackgroundColor: ColorManager.blackColor,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateTextStyle.resolveWith(
                  (states) => const TextStyle(
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
        HadethDetailsScreen.routeName:(_)=>const HadethDetailsScreen(),
        QuranDetailsScreen.routeName:(_)=>QuranDetailsScreen(),
        OnBoardingView.routeName: (_) => BlocProvider<OnBoardingCubit>(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView()
        ),
      },
      initialRoute: PrefsManager.getIfFirstTime() != null?
      HomeScreen.routeName:
      OnBoardingView.routeName,
    );
  }
}

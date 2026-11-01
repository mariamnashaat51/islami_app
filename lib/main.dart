import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';

import 'ui/screens/OnBoarding/on_boarding_screen.dart';
import 'ui/screens/screen_hadith/hadith_details/hadith_details_screen.dart';
import 'ui/screens/screen_sura/sura_details/sura_details_screen.dart';
import 'ui/screens/screen_sura/sura_details_1/sura_details_screen_1.dart';
import 'ui/screens/screen_sura/sura_details_together/sura_details_together.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRouteName,
      routes: {
        AppRoutes.onBoardingRouteName: (context) => OnBoardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.suraDetails1RouteName: (context) => SuraDetailsScreen1(),
        AppRoutes.suraDetailsTogetherRouteName: (context) =>
            SuraDetailsTogether(),
        AppRoutes.hadithDetailsScreenRouteName: (context) =>
            HadithDetailsScreen(),
      },
    );
  }
}

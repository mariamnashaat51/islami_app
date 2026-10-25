import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';

import 'ui/screens/OnBoarding/on_boarding_screen.dart';
import 'ui/screens/sura_details/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.homeRouteName,
      initialRoute: AppRoutes.onBoardingRouteName,
      routes: {
        AppRoutes.onBoardingRouteName: (context) => OnBoardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
      },
    );
  }
}

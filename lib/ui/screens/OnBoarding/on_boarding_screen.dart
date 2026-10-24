import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  static const Color backgroundColor = AppColors.blackAppColor;
  static const Color goldColor = AppColors.primaryAppColor;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.sizeOf(context).width;

    final pageDecoration = PageDecoration(
      pageColor: backgroundColor,
      bodyPadding: EdgeInsets.symmetric(horizontal: widthScreen * 0.06),
      bodyAlignment: Alignment.center,
      imageAlignment: Alignment.center,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: IntroductionScreen(
        globalBackgroundColor: backgroundColor,

        globalHeader: SafeArea(
          bottom: false,
          child: Center(child: Image.asset(AppAssets.logo)),
        ),

        pages: [
          _builtPageViewModel(
            context: context,
            data: 'Welcome To Islami App',
            detailsData: '',
            imagePath: AppAssets.intoImage1,
            pageDecoration: pageDecoration,
          ),

          _builtPageViewModel(
            context: context,
            data: 'Welcome To Islami',
            detailsData: 'We Are Very Excited To Have You In Our Community',
            imagePath: AppAssets.intoImage2,
            pageDecoration: pageDecoration,
          ),

          _builtPageViewModel(
            context: context,
            data: 'Reading the Quran',
            detailsData: 'Read, and your Lord is the Most Generous',
            imagePath: AppAssets.intoImage3,
            pageDecoration: pageDecoration,
          ),

          _builtPageViewModel(
            context: context,
            data: 'Bearish',
            detailsData: 'Praise the name of your Lord, the Most High',
            imagePath: AppAssets.intoImage4,
            pageDecoration: pageDecoration,
          ),

          _builtPageViewModel(
            context: context,
            data: 'Holy Quran Radio',
            detailsData: 'You can listen to the Holy Quran Radio through the application for free and easily',
            imagePath: AppAssets.intoImage5,
            pageDecoration: pageDecoration,
          ),
        ],

        onDone: _finishOnBoarding,
        onSkip: _finishOnBoarding,

        showSkipButton: false,
        showBackButton: true,

        back: _builtText(data: 'Back'),

        next: _builtText(data: 'Next'),

        done: _builtText(data: 'Finish'),

        controlsPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        dotsDecorator: const DotsDecorator(
          size: Size(7, 7),
          color: Color(0xFF707070),
          activeSize: Size(18, 7),
          activeColor: goldColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(27)),
          ),
        ),
      ),
    );
  }

  Widget _builtText({required String data}) {
    return Text(
      data,
      style: TextStyle(
        color: goldColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  void _finishOnBoarding() {
    Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
  }

  PageViewModel _builtPageViewModel({
    required BuildContext context,
    required PageDecoration pageDecoration,
    required String imagePath,
    required String data,
    required String detailsData,
  }) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return PageViewModel(
      title: '',
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: screenHeight * 0.04,
        children: [
          SizedBox(height: screenHeight * 0.1),

          Image.asset(imagePath),

          Text(
            data,
            style: const TextStyle(
              color: goldColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),

          if (detailsData.isNotEmpty)
            Text(
              detailsData,
              style: const TextStyle(
                color: goldColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
      decoration: pageDecoration,
    );
  }
}

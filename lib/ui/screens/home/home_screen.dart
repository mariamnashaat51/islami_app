import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/ui/screens/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImageList = [
    AppAssets.quranBg,
    AppAssets.hadithBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  Map<int, String> backgroundImageMap = {
    0: AppAssets.quranBg,
    1: AppAssets.hadithBg,
    2: AppAssets.sebhaBg,
    3: AppAssets.radioBg,
    4: AppAssets.timeBg,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: AppColors.primaryAppColor),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.whiteAppColor,
          unselectedItemColor: AppColors.blackAppColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            builtBottomNavigationBarItem(
              icon: AppAssets.iconQuran,
              label: 'Quran',
              index: 0,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.iconHadith,
              label: 'Hadith',
              index: 1,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.iconSebha,
              label: 'Sebha',
              index: 2,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.iconRadio,
              label: 'Radio',
              index: 3,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.iconTime,
              label: 'Time',
              index: 4,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            backgroundImageMap[selectedIndex]!,
            // backgroundImageFunction(),
            // backgroundImageList[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              spacing: 20,
              children: [
                Image.asset(AppAssets.logo),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlackAppColor,
                borderRadius: BorderRadius.circular(66),
              ),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }

  String backgroundImageFunction() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.quranBg;
      case 1:
        return AppAssets.hadithBg;
      case 2:
        return AppAssets.sebhaBg;
      case 3:
        return AppAssets.radioBg;
      case 4:
        return AppAssets.timeBg;
      default:
        return AppAssets.quranBg;
    }
  }
}

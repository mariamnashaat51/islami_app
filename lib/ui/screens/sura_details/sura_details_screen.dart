import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    double width = context.width;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.blackAppColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackAppColor,
        foregroundColor: AppColors.primaryAppColor,
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20Primary,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.bySuraDetailsScreen),
          ),
        ),
        padding: EdgeInsets.only(top: height * 0.04, bottom: height * 0.12),
        child: Column(
          spacing: height * 0.018,
          children: [
            Text(
              QuranResources.arabicQuranSuraList[index],
              style: AppStyles.bold24Primary,
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container(color: AppColors.primaryAppColor)),
          ],
        ),
      ),
    );
  }
}

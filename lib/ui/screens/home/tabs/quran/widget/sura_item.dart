import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';

class SuraItem extends StatelessWidget {
  int index;

  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Row(
      spacing: width * 0.04,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraNumberVector),
            Text('${index + 1}', style: AppStyles.bold14White),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuraList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranResources.versesNumbersList[index]} Verses',
              style: AppStyles.bold14White,
            ),
          ],
        ),

        Spacer(),

        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}

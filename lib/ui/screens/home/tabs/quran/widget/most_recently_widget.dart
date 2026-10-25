import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.16,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.02,
              vertical: context.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryAppColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Al-Anbiya', style: AppStyles.bold24black),
                    Text('الأنبياء', style: AppStyles.bold24black),
                    Text('112 Verses  ', style: AppStyles.bold14black),
                  ],
                ),
                Image.asset(AppAssets.mostRecent),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: context.width * 0.02);
        },
        itemCount: 20,
      ),
    );
  }
}

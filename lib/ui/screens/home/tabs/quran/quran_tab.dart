import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/widget/sura_item.dart';

import 'widget/most_recently_widget.dart';

/*
width = 430
height = 932
*/
class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = AppSizeUtils.getWidth(context);
    // double height = AppSizeUtils.getHeight(context);

    double width = context.width;
    double height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        spacing: height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builtSearchSection(),
          Text('Most Recently', style: AppStyles.bold16White),
          MostRecentlyWidget(),
          Text('Suras List', style: AppStyles.bold16White),
          _builtSuraListSection(
            onSuraItemTap: (index) {
              Navigator.of(context)
                  .pushNamed(AppRoutes.suraDetailsRouteName, arguments: index);
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _builtDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: AppColors.primaryAppColor),
    );
  }

  Widget _builtSearchSection() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Sura Name',
        hintStyle: AppStyles.bold16White,
        prefixIcon: Image.asset(AppAssets.prefixTextFiled),
        enabledBorder: _builtDecorationBorder(),
        focusedBorder: _builtDecorationBorder(),
      ),
      cursorColor: AppColors.primaryAppColor,
      style: AppStyles.bold16White,
    );
  }

  Widget _builtSuraListSection({required void Function(int) onSuraItemTap}) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onSuraItemTap(index);
            },
            child: SuraItem(index: index),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: context.height * 0.02,
            thickness: 1,
            color: AppColors.whiteAppColor,
            indent: context.width * 0.14,
            endIndent: context.width * 0.14,
          );
        },
        itemCount: QuranResources.versesNumbersList.length, //114
      ),
    );
  }
}

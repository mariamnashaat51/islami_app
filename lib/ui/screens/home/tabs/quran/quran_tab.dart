import 'package:flutter/material.dart';
import 'package:islami_app/core/shared_prefs_utils.dart';
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
class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    // double width = AppSizeUtils.getWidth(context);
    // double height = AppSizeUtils.getHeight(context);
    double width = context.width;
    double height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _builtSearchSection(),
            // Text('Most Recently', style: AppStyles.bold16White),
            MostRecentlyWidget(),
            Text('Quran List', style: AppStyles.bold16White),
            _builtSuraListSection(
              onSuraItemTap: (index) {
                Navigator.of(context).pushNamed(
                  AppRoutes.suraDetailsTogetherRouteName,
                  arguments: index,
                ); // الآيات في سطور
              },
            ),
          ],
        ),
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
      cursorColor: AppColors.primaryAppColor,
      style: AppStyles.bold16White,
      decoration: InputDecoration(
        hintText: 'Sura Name',
        hintStyle: AppStyles.bold16White,
        prefixIcon: Image.asset(AppAssets.prefixTextFiled),
        enabledBorder: _builtDecorationBorder(),
        focusedBorder: _builtDecorationBorder(),
      ),
      onChanged: (text) {
        searchBySuraName(text);
      },
    );
  }

  Widget _builtSuraListSection({required void Function(int) onSuraItemTap}) {
    return filterList.isEmpty
        ? Center(
      child: Text(
        'No Sura name found!',
        style: AppStyles.bold24Primary,
      ),
    )
        : ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // TODO: save sura index in shared prefs
            saveLastSuraIndex(filterList[index]);
            // TODO: navigate to sura details screen
            onSuraItemTap(filterList[index]);
          },
          child: SuraItem(index: filterList[index]),
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
      itemCount: filterList.length,
      // itemCount: QuranResources.versesNumbersList.length, //114
    );
  }

  void searchBySuraName(String searchText) {
    List<int> searchList = [];
    for (int i = 0; i < QuranResources.versesNumbersList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
        searchText.toLowerCase(),
      ) ||
          QuranResources.arabicQuranSuraList[i].contains(searchText)) {
        searchList.add(i);
      }
      filterList = searchList;
      setState(() {});
    }
  }
}

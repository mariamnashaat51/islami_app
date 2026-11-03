import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import 'widget/radio_item.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<String> radioName = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];
  List<String> recitersName = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
            decoration: BoxDecoration(
              color: AppColors.lightBlackAppColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              dividerColor: AppColors.transparentColor,
              indicator: BoxDecoration(
                color: AppColors.primaryAppColor,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.liteBlackAppColor,
              unselectedLabelColor: AppColors.whiteAppColor,
              labelStyle: AppStyles.bold16Black,
              unselectedLabelStyle: AppStyles.bold16White,
              tabs: [
                Tab(text: 'Radio'),
                Tab(text: 'Reciters'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // TODO: Radio tab content
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.012,
                  ),
                  child: ListView.separated(
                    itemCount: radioName.length,
                    itemBuilder: (context, index) {
                      return RadioItem(
                        radioName: radioName[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.02),
                  ),
                ),
                //TODO: Reciters tab content
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.012,
                  ),
                  child: ListView.separated(
                    itemCount: recitersName.length,
                    itemBuilder: (context, index) {
                      return RadioItem(
                        radioName: recitersName[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.02),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

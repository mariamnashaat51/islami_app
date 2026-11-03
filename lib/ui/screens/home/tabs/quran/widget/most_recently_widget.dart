import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

class MostRecentlyWidget extends StatefulWidget {
  const MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  // List<int> mostRecentList = []; ==> put in provider

  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // TODO: this is bloc of code can be execute before build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // TODO: this is bloc of code can be execute after build
      mostRecentProvider.getLastSuraIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // TODO : navigate to sura details screen
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsTogetherRouteName,
                      arguments: mostRecentProvider.mostRecentList[index],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.01,
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
                            Text(
                              QuranResources
                                  .englishQuranSuraList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources
                                  .arabicQuranSuraList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              '${QuranResources.versesNumbersList[mostRecentProvider.mostRecentList[index]]} Verses',
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecent),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
              // itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

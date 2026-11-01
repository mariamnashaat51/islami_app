import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';

import 'sura_content.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    int? selectedVerseIndex;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    // double width = context.width;
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
            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryAppColor,
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return SuraContent(
                          content: verses[index],
                          index: index,
                          isSelected: selectedVerseIndex == index,
                          onTap: () {
                            setState(() {
                              if (selectedVerseIndex == index) {
                                selectedVerseIndex = null;
                              } else {
                                selectedVerseIndex = index;
                              }
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: verses.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String suraContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = suraContent.split('\n');
    verses = lines;
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {});
    });
  }
}

/* Expanded(
              child: showVerses
                  ? verses.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryAppColor,
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return SuraContent(
                                content: verses[index],
                                index: index,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount: verses.length,
                          )
                  : SingleChildScrollView(
                      child: SuraContent1(content: content),
                    ),
            ),*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/screen_sura/sura_details/sura_content.dart';
import 'package:islami_app/ui/screens/screen_sura/sura_details_1/sura_content_1.dart';

class SuraDetailsTogether extends StatefulWidget {
  const SuraDetailsTogether({super.key});

  @override
  State<SuraDetailsTogether> createState() => _SuraDetailsTogetherState();
}

class _SuraDetailsTogetherState extends State<SuraDetailsTogether> {
  List<String> verses = [];
  bool showVerses = true;
  String content = '';
  int? selectedVerseIndex;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    if (content.isEmpty) {
      loadSuraFileContent(index);
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showVerses = !showVerses;
              });
            },
            icon: Icon(
              showVerses ? Icons.menu_outlined : Icons.menu_book_outlined,
            ),
          ),
        ],
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
              child: showVerses
                  ? verses.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryAppColor,
                            ),
                          )
                        : SingleChildScrollView(
                            child: SuraContent1(content: content),
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
                      separatorBuilder: (context, index) => SizedBox(),
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

  void loadSuraFileContent(int index) async {
    String suraContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = suraContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += ' {${i + 1}} ';
    }
    content = lines.join('');
    Future.delayed(Duration(milliseconds: 300), () => setState(() {}));
  }
}

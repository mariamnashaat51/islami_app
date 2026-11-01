import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/home/common/main_loading_widget.dart';

import 'sura_content_1.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  const SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
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
              child: content.isEmpty
                  ? MainLoadingWidget()
                  : SingleChildScrollView(
                      child: SuraContent1(content: content),
                    ),
            ),
          ],
        ),
      ),
    );
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

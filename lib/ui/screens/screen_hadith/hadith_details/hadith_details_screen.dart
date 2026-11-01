import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/hadith_resources_args.dart';
import 'package:islami_app/ui/screens/home/common/content_item.dart';

class HadithDetailsScreen extends StatefulWidget {
  const HadithDetailsScreen({super.key});

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HadithResourcesArgs args =
        ModalRoute.of(context)?.settings.arguments as HadithResourcesArgs;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.blackAppColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackAppColor,
        foregroundColor: AppColors.primaryAppColor,
        title: Text('Hadith ${args.index}', style: AppStyles.bold20Primary),
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
              args.hadithResources!.title,
              style: AppStyles.bold24Primary,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ContentItem(content: args.hadithResources!.content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

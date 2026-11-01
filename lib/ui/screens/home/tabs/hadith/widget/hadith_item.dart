import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/hadith_resources.dart';
import 'package:islami_app/model/hadith_resources_args.dart';
import 'package:islami_app/ui/screens/home/common/main_loading_widget.dart';

class HadithItem extends StatefulWidget {
  final int index;

  const HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithResources? hadithResources;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithContentFile();
  }

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return InkWell(
      onTap: () {
        // todo: navigator to screen_hadith details screen
        Navigator.of(context).pushNamed(
          AppRoutes.hadithDetailsScreenRouteName,
          arguments: HadithResourcesArgs(
            index: widget.index,
            hadithResources: hadithResources,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryAppColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  AppAssets.byHadithCard,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            hadithResources == null
                ? MainLoadingWidget(color: AppColors.blackAppColor)
                : Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.09,
                      right: width * 0.09,
                      top: height * 0.04,
                      bottom: height * 0.1,
                    ),
                    child: Column(
                      children: [
                        Text(
                          hadithResources?.title ?? '',
                          style: AppStyles.bold24black,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              hadithResources?.content ?? '',
                              style: AppStyles.bold16black,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              strutStyle: const StrutStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void loadHadithContentFile() async {
    String hadithContentFile = await rootBundle.loadString(
      'assets/files/hadith/h${widget.index}.txt',
    );

    int endTitle = hadithContentFile.indexOf('\n');
    String title = hadithContentFile.substring(0, endTitle);
    String content = hadithContentFile.substring(endTitle + 1);

    hadithResources = HadithResources(title: title, content: content);

    Future.delayed(Duration(milliseconds: 300), () => setState(() {}));

    // List<String> hadithLines = hadithContentFile.split('\n');
    // String title = hadithLines[0];
    // hadithLines.removeAt(0);
  }
}

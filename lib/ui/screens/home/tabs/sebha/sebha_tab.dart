import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double routate = 0.0;
  String zekr = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(data: 'سَبِّحِ اسْمَ رَبِّكَ الأعلى'),

        Image.asset(AppAssets.sebha, fit: BoxFit.cover),

        Transform.translate(
          offset: Offset(0, -height * 0.014),
          child: InkWell(
            onTap: onTap,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    spacing: height * 0.04,
                    children: [
                      textWidget(data: zekr, textStyle: AppStyles.bold26White),
                      textWidget(data: '$counter'),
                    ],
                  ),

                  Transform.rotate(
                    angle: routate,
                    child: Image.asset(AppAssets.sebhaBody),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget textWidget({required String data, TextStyle? textStyle}) {
    return Text(
      data,
      style: textStyle ?? AppStyles.bold36White,
      textAlign: TextAlign.center,
      maxLines: 5,
    );
  }

  void onTap() {
    if (counter >= 100) {
      zekr = 'سبحان الله';
      counter = 0;
      return;
    }
    counter++;
    routate += 0.5;
    switch (counter) {
      case 33:
        zekr = 'الحمدلله';
        break;
      case 66:
        zekr = 'الله أكبر';
        break;
      case 99:
        zekr =
            'الله لا إله إلا هو \nله الملك \nو له الحمد \nو هو علي كل شئ قدير';
        break;
      case 100:
        zekr = 'تم';
        break;
      default:
    }
    setState(() {});
  }
}

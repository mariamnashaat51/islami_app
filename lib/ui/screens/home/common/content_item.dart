import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class ContentItem extends StatelessWidget {
  final String content;

  const ContentItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.09),
      child: Text(
        content,
        style: AppStyles.bold20Primary,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        strutStyle: StrutStyle(height: 3.5),
      ),
    );
  }
}

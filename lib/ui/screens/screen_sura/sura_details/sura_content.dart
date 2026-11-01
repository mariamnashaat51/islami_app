import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const SuraContent({
    super.key,
    required this.content,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.08,
          vertical: height * 0.01,
        ),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryAppColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryAppColor),
        ),
        child: Text(
          '$content {${index + 1}}',
          style: AppStyles.bold20Primary.copyWith(
            color: isSelected
                ? AppColors.blackAppColor
                : AppColors.primaryAppColor,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}

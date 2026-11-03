import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({super.key, required this.radioName, required this.index});

  final String radioName;
  final int index;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlay = true;
  bool isVolumeUp = true;

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryAppColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: widget.index == 1
              ? AssetImage(AppAssets.radioContainerWaveBg)
              : AssetImage(AppAssets.radioContainerBg),
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        spacing: height * 0.02,
        children: [
          Text(
            widget.radioName,
            style: AppStyles.bold20Black,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isPlay = !isPlay;
                  });
                },
                icon: Icon(
                  isPlay ? Icons.play_arrow_rounded : Icons.pause_rounded,
                  size: 40,
                  color: AppColors.blackAppColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isVolumeUp = !isVolumeUp;
                  });
                },
                icon: Icon(
                  isVolumeUp
                      ? Icons.volume_up_rounded
                      : Icons.volume_mute_rounded,
                  size: 30,
                  color: AppColors.blackAppColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

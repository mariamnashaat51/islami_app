import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  bool isVolumeUp = true;

  final List<Map<String, String>> prayerTimes = [
    {'name': 'Fajr', 'time': '04:04', 'period': 'AM'},
    {'name': 'Sunrise', 'time': '01:04', 'period': 'PM'},
    {'name': 'Dhuhr', 'time': '01:01', 'period': 'PM'},
    {'name': 'ASR', 'time': '04:38', 'period': 'PM'},
    {'name': 'Maghrib', 'time': '07:57', 'period': 'PM'},
    {'name': 'Isha', 'time': '09:15', 'period': 'PM'},
  ];

  final List<Map<String, String>> azkarList = [
    {'title': 'Evening Azkar', 'image': AppAssets.azkarImage1},
    {'title': 'Morning Azkar', 'image': AppAssets.azkarImage2},
    {'title': 'Evening Azkar', 'image': AppAssets.azkarImage1},
    {'title': 'Morning Azkar', 'image': AppAssets.azkarImage2},
    {'title': 'Evening Azkar', 'image': AppAssets.azkarImage1},
    {'title': 'Morning Azkar', 'image': AppAssets.azkarImage2},
  ];

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.012,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: height * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Prayer Times Card
            Container(
              height: height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.goldAppColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  // Date Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Text(
                          '16 Jul,\n2024',
                          style: AppStyles.bold16White,
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: width * 0.38,
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        decoration: BoxDecoration(
                          color: AppColors.primaryAppColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Pray Time',
                              style: AppStyles.bold20LightBlack,
                            ),
                            Text('Tuesday', style: AppStyles.bold20Black),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Text(
                          '09 Muh,\n1446',
                          style: AppStyles.bold16White,
                        ),
                      ),
                    ],
                  ),

                  // Prayer Times Carousel
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryAppColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.016),
                        child: Column(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 128,
                                enlargeCenterPage: true,
                                viewportFraction: 0.3,
                                enlargeFactor: 0.2,
                              ),
                              items: prayerTimes.map((prayer) {
                                return Container(
                                  width: 104,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.liteBlackAppColor,
                                        AppColors.gradientAppColor,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        prayer['name']!,
                                        style: AppStyles.bold16White,
                                      ),
                                      Text(
                                        prayer['time']!,
                                        style: AppStyles.bold32White,
                                      ),
                                      Text(
                                        prayer['period']!,
                                        style: AppStyles.bold16White,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            // Next Prayer
                            Row(
                              children: [
                                const Spacer(),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Next Pray ',
                                        style: AppStyles.bold16LightBlack,
                                      ),
                                      TextSpan(
                                        text: '- 02:32',
                                        style: AppStyles.bold16Black,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVolumeUp = !isVolumeUp;
                                    });
                                  },
                                  icon: Icon(
                                    isVolumeUp
                                        ? Icons.volume_up_rounded
                                        : Icons.volume_off_rounded,
                                    size: 20,
                                    color: AppColors.blackAppColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Azkar Title
            Text('Azkar', style: AppStyles.bold16Azkar),

            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: azkarList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.06,
                mainAxisSpacing: height * 0.02,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // TODO: Navigate to Azkar Screen
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.liteBlackAppColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.goldAppColor,
                        width: 1.5,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.012,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image.asset(
                            azkarList[index]['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          azkarList[index]['title']!,
                          style: AppStyles.bold16White,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

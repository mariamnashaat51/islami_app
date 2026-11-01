import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/home/tabs/hadith/widget/hadith_item.dart';

class HadithTab extends StatelessWidget {
  HadithTab({super.key});

  final List<int> itemsIndex = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    double height = context.height;

    return CarouselSlider(
      options: CarouselOptions(height: height * 0.65, enlargeCenterPage: true),
      items: itemsIndex.map((index) => HadithItem(index: index)).toList(),
    );
  }
}

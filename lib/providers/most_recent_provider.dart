import 'package:flutter/material.dart';
import 'package:islami_app/core/shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  // TODO: Data && Function change this Data
  List<int> mostRecentList = [];

  // TODO: get data - read data
  void getLastSuraIndex() async {
    // TODO: initialize shared prefs .
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // TODO: get List<String> from shared prefs , make empty list
    List<String> mostRecentlyListAsString =
        prefs.getStringList(SharedPrefsKeys.key) ?? [];
    // TODO: convert List<String> to List<int> ==> using .map().toList();
    // TODO: List<String> ==> List<int> using .map
    mostRecentList = mostRecentlyListAsString.map((stringIndex) {
      return int.parse(stringIndex);
    }).toList();
    notifyListeners();
  }
}

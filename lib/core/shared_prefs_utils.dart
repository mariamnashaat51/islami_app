import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String key = 'sura_index';
}

// TODO: save data - write data
void saveLastSuraIndex(int suraIndex) async {
  // TODO: initialize shared prefs .
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // TODO: get List<String> from shared prefs , make empty list
  List<String> mostRecentlyList =
      prefs.getStringList(SharedPrefsKeys.key) ?? [];
  // TODO: add suraIndex in mostRecentlyList
  // TODO: duplicate
  if (mostRecentlyList.contains('$suraIndex')) {
    // TODO: found index in list
    // TODO: remove index from list
    mostRecentlyList.remove('$suraIndex');
    // TODO: add index in first item in list+
    // mostRecentlyList.add('$suraIndex');
    mostRecentlyList.insert(0, '$suraIndex');
  } else {
    // TODO: not found index in list
    // TODO: add index in first item in list
    // mostRecentlyList.add('$suraIndex');
    mostRecentlyList.insert(0, '$suraIndex');
  }
  // TODO: limit
  if (mostRecentlyList.length > 5) {
    mostRecentlyList.removeLast();
  }
  // TODO: save List in shared prefs.
  prefs.setStringList(SharedPrefsKeys.key, mostRecentlyList);
}

// TODO: get data - read data ==> change data!! put in provider
/*Future<List<int>> getLastSuraIndex() async {
  // TODO: initialize shared prefs .
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // TODO: get List<String> from shared prefs , make empty list
  List<String> mostRecentlyListAsString =
      prefs.getStringList(SharedPrefsKeys.key) ?? [];
  // TODO: convert List<String> to List<int> ==> using .map().toList();
  // TODO: List<String> ==> List<int> using .map
  List<int> mostRecentlyListAsInt = mostRecentlyListAsString.map((stringIndex) {
    return int.parse(stringIndex);
  }).toList();

  // return mostRecentlyListAsInt.reversed.toList();
  return mostRecentlyListAsInt;
}*/

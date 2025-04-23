import 'package:islami_c14/style/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/SuraModel.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static onboardingFirstTime() {
    prefs.setBool('FirstTime', false);
  }

  static bool onboardingActive() {
    return prefs.getBool('FirstTime') ?? true;
  }

  static saveMostRecently(List<SuraModel> mostRecent) {
    List<String> newList =
        mostRecent.map((suraModel) => suraModel.suraNameEn).toList();
    prefs.setStringList("mostrecent", newList);
  }

  static List<SuraModel> getMostRecently() {
    List<String> newList = prefs.getStringList("mostrecent") ?? [];
    List<SuraModel> mostRecent = [];
    for (int i = 0; i < newList.length; i++) {
      SuraModel sura = AppConstants.surasList
          .firstWhere((sura) => sura.suraNameEn == newList[i]);
      mostRecent.add(sura);
    }
    return mostRecent;
  }
}

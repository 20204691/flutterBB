import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  // static void clear() => pref.clear();

  static Future<void> saveSleepDateTime(DateTime sleepDateTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sleep_date_time", sleepDateTime.toString());
  }

  static Future<String> getSleepDateTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var dateTime = prefs.getString("sleep_date_time");
    return dateTime ?? '';
  }

  static Future<void> saveWakeUpDateTime(DateTime sleepDateTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("wake_up_date_time", sleepDateTime.toString());
  }

  static Future<String> getWakeUpDateTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var dateTime = prefs.getString("wake_up_date_time");
    return dateTime ?? '';
  }
}

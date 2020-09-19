library nft_local_storage;

import 'package:shared_preferences/shared_preferences.dart';

/// This class for local storage using SharedPreferences
class LocalStorage {
  // Create new Future ref to SharedPreferences instance
  final Future<SharedPreferences> sharedPrefs = SharedPreferences.getInstance();

  /// Save data with primary data types: String, List<String>, double, int, bool
  Future<bool> saveData<T>(String key, T value) async {
    // Get SharedPreferences ref
    final SharedPreferences prefs = await sharedPrefs;
    // With primary data type, save to local
    if (T is String) {
      return prefs.setString(key, value as String);
    } else if (T is bool) {
      return prefs.setBool(key, value as bool);
    } else if (T is int) {
      return prefs.setInt(key, value as int);
    } else if (T is double) {
      return prefs.setDouble(key, value as double);
    } else if (T is List<String>) {
      return prefs.setStringList(key, value as List<String>);
    }
    // Default return false
    return false;
  }

  // Get data by key
  Future<T> getData<T>(String key) async {
    // Get SharedPreferences ref
    final SharedPreferences prefs = await sharedPrefs;
    // Get data by key with cast to output data type
    return prefs.get(key) as T;
  }
}

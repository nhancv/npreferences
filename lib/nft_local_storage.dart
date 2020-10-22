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

    // Delete if value is null
    if(value == null) {
      return prefs.remove(key);
    }

    // With primary data type, save to local
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
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

  // Clear all
  Future<bool> clear() async {
    // Get SharedPreferences ref
    final SharedPreferences prefs = await sharedPrefs;
    // Clear all data
    return prefs.clear();
  }
}

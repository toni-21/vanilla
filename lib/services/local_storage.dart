import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vanilla/models/response/user.dart';
import 'package:vanilla/utilities/function_helpers/printf.dart';

class LocalStorage {
  late SharedPreferences prefs;

  LocalStorage() {
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }

//set String into shared preferences like this
  Future<bool> setInt(String key, int value) async {
    prefs.setInt(key, value).then((value) {});
    return true;
  }

//get String value from shared preferences
  Future<int?> getInt(String key) async {
    int? storage;
    storage = prefs.getInt(key) ?? 0;
    return storage;
  }

//set bool into shared preferences like this
  Future<bool> setBool(String key, bool value) async {
    prefs.setBool(key, value).then((value) {});
    return true;
  }

//get bool value from shared preferences
  Future<bool?> getBool(String? key) async {
    bool? storage;
    storage = prefs.getBool(key!);
    return storage;
  }

  //set bool into shared preferences like this
  Future<bool> setString(String key, String value) async {
    prefs.setString(key, value).then((value) {});
    return true;
  }

//get bool value from shared preferences
  Future<String?> getString(String key) async {
    String? storage;
    storage = prefs.getString(key);
    return storage;
  }

  //remove any value from shared preferences like this
  Future<bool> remove(String key) async {
    prefs.remove(key);
    return true;
  }

  //clear Preferences preferences
  Future<bool?> clear({bool onlyToken = false}) async {
    final cleared = await prefs.clear();
    await prefs.reload();
    return cleared;
  }

  Future<void> setUser(UserModel user) async {
    String str = jsonEncode(user.toMap());
    printf('SAVED VALUE IS  - ${str}');
    await prefs.setString('currentUser', str);
  }

  Future<UserModel?> getUser() async {
    String? str = prefs.getString('currentUser');
    if (str == null) {
      return null;
    } else {
      final map = jsonDecode(str);
      printf('SAVED VALUE WAS  - ${map}');
      return UserModel.fromJson(map, documentId: map['documentId']);
    }
  }
}

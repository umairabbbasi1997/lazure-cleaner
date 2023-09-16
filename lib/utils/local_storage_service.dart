import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/UserResponse.dart';

class LocalStorageService {
  save(String key, data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(data));
  }

  saveDouble(String key, double data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, data);
  }

  saveBoolean(String key, data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, data);
  }

  readBoolean(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(key) != null) {
      return prefs.getBool(key);
    } else {
      return false;
    }
  }

  read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) != null) {
      return jsonDecode(prefs.getString(key).toString());
    } else {
      return null;
    }
  }

  readDouble(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble(key) != null) {
      return prefs.getDouble(key);
    } else {
      return null;
    }
  }

  remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


}

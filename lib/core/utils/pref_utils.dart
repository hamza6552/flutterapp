import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  Future<String> getStringData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var data = storage.get(key);
    if (data != null) {
      return json.decode(data.toString());
    }
    return data.toString();
  }

  setStringData(String key, dynamic data) async {
    var storage = await SharedPreferences.getInstance();
    var encodedData = json.encode(data);
    await storage.setString(key, encodedData);
  }

  Future<int> getIntData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var data = storage.getInt(key);
    if (data != null) {
      return json.decode(data.toString());
    }
    return data ?? 0;
  }

  setIntData(String key, int data) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(key, data);
  }

  setBoolData(String key, bool data) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(key, data);
  }

  Future<bool> getBoolData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var data = storage.getBool(key);
    return data ?? false;
  }

  removeData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var v = storage.remove(key);
    return v;
  }

  clearData() async {
    var storage = await SharedPreferences.getInstance();
    await storage.clear();
  }
}

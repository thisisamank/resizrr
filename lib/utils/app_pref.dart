import 'package:flutter/material.dart';
import 'package:resizrr/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppPreference {

  AppPreference._(); // Private Constructor

  static final instance = AppPreference._();

  late SharedPreferences _pref;

  bool isInit = false;

  Future<void> init() async {
     if (!isInit) {
       _pref = await SharedPreferences.getInstance();
     }
    isInit = true;
  }

  SharedPreferences get pref => _pref;

  void setTheme(String key, String theme) async{
      await init();
      await _pref.setString(key, theme);
  }

  Future<String> getTheme(String key) async{
    await init();
    return _pref.getString(key) ?? Themes.system;
  }

}

class Themes  {
  static const dark = 'dark';
  static const light = 'light';
  static const system = 'system';

  static const KEY = "_theme";
}
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUser {
  static final PrefsUser _instance = new PrefsUser._internal();
  factory PrefsUser() {
    return _instance;
  }

  PrefsUser._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get uri {
    return _prefs.getString('url') ?? '';
  }

  set uri(String value) {
    _prefs.setString('url', value);
  }

  get key {
    return _prefs.getString('key') ?? '';
  }

  set key(String value) {
    _prefs.setString('key', value);
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', base64.encode(utf8.encode(value + ':')));
  }

  get initScreen {
    return _prefs.getInt('initScreen') ?? 0;
  }

  set initScreen(int value) {
    _prefs.setInt('initScreen', value);
  }
}

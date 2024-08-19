import 'dart:convert';
import 'package:boost_test/models/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection.dart';


class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);


  final String _PREFS_KEY_TOKEN = 'PREFS_KEY_TOKEN';
  final String _PREFS_KEY_USER_DATA = 'PREFS_KEY_USER_DATA';



  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(_PREFS_KEY_TOKEN, token);
  }

  Future<void> setUserData(LoginModel user) async {
    await _sharedPreferences.setString(
        _PREFS_KEY_USER_DATA, jsonEncode(user.toJson()));
  }

  LoginModel getUserData() {
    String data = _sharedPreferences.getString(_PREFS_KEY_USER_DATA) ?? '';
    LoginModel user = LoginModel.fromJson(data.isNotEmpty ? jsonDecode(data) : <String, dynamic>{});
    return user;
  }

  String getUserToken() {
    return _sharedPreferences.getString(_PREFS_KEY_TOKEN) ?? '';
  }

  String getUserTokenImage() {
    return _sharedPreferences.getString(_PREFS_KEY_TOKEN) ?? '';
  }

  bool getUserLoggedIn() {
    return _sharedPreferences.getString(_PREFS_KEY_TOKEN)?.isNotEmpty ?? false;
  }


}

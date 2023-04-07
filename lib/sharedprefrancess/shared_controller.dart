import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainingproj/Modals/user.dart';

enum PrefKeys { name, email, loggedIn , language }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();
  late SharedPreferences _sharedPrefrences;

  SharedPrefController._();

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPreferences() async {
    _sharedPrefrences = await SharedPreferences.getInstance();
  }

  Future<void> save(User user) async {
    await _sharedPrefrences.setString(PrefKeys.name.name, user.name);
    await _sharedPrefrences.setString(PrefKeys.email.name, user.email);
    await _sharedPrefrences.setBool(PrefKeys.loggedIn.name, true);
  }

  bool get loggedIn =>
      _sharedPrefrences.getBool(PrefKeys.loggedIn.name) ?? false;

  Future<bool> delete({required String Key}) async {
    if (_sharedPrefrences.containsKey(Key)) {
      return await _sharedPrefrences.remove(Key);
    }
    return false;
  }

  Future<void> changeLanguage({ required String Newlanguage}) async{
    await _sharedPrefrences.setString(PrefKeys.language.name, Newlanguage)  ;
  }


  String get language => _sharedPrefrences.getString(PrefKeys.language.name) ??  'en';

  Future<void> clear() async{
    await _sharedPrefrences.clear();

  }
}

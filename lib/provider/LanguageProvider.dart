import 'package:flutter/material.dart';
import 'package:trainingproj/sharedprefrancess/shared_controller.dart';

class LanguageProvider extends ChangeNotifier {
  String language = SharedPrefController().language;

  void changeLanguage() async {
    language = language == "en" ? "ar" : 'en';
    await SharedPrefController().changeLanguage(Newlanguage: language);
    notifyListeners();
  }
}

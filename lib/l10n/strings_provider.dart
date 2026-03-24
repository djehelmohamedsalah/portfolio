import 'package:flutter/material.dart';
import 'app_strings.dart';
import 'app_strings_en.dart';
import 'app_strings_de.dart';

class StringsProvider extends ChangeNotifier {
  AppStrings _strings = AppStringsEn();
  Locale _currentLocale = const Locale('en');

  AppStrings get strings => _strings;
  Locale get currentLocale => _currentLocale;

  void setLanguage(Locale locale) {
    if (_currentLocale == locale) return;
    
    _currentLocale = locale;
    if (locale.languageCode == 'de') {
      _strings = AppStringsDe();
    } else {
      _strings = AppStringsEn();
    }
    notifyListeners();
  }
}

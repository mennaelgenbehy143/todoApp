import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  ThemeMode mode = ThemeMode.light;

  void setNewMode(ThemeMode newMode){
    if(mode == newMode){
      return;
    }else{
      mode = newMode;
    }
    notifyListeners();
  }

  void setNewLanguage(String newLang){
    if(appLanguage == newLang){
      return;
    }else{
      appLanguage = newLang;
    }
    notifyListeners();
  }

}
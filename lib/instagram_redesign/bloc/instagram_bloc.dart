import 'package:flutter/material.dart';

enum SettingsSate { visible, hide }
enum ViewState { ample, clean, old }

class InstagramBloc with ChangeNotifier {
  SettingsSate settingState = SettingsSate.hide;
  ViewState viewState = ViewState.clean;
  ThemeMode themeMode = ThemeMode.light;



  void showSettings() {
    settingState = SettingsSate.visible;
    notifyListeners();
  }

  void hideSettings() {
    settingState = SettingsSate.hide;
    notifyListeners();
  }

  void changeView(ViewState state) {
    viewState = state;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

export 'package:flutter_projects/projects/instagram_redesign/models/ig_activity.dart';
export 'package:flutter_projects/projects/instagram_redesign/models/ig_collection.dart';
export 'package:flutter_projects/projects/instagram_redesign/models/ig_external_platform.dart';
export 'package:flutter_projects/projects/instagram_redesign/models/ig_post.dart';
export 'package:flutter_projects/projects/instagram_redesign/models/ig_user.dart';
export 'package:flutter_projects/projects/instagram_redesign/models/ig_user_stories.dart';
enum SettingsState { visible, hide }
enum ViewState { ample, clean, old }

class InstagramBloc with ChangeNotifier {
  SettingsState settingState = SettingsState.hide;
  ViewState viewState = ViewState.ample;
  ThemeMode themeMode = ThemeMode.light;



  void showSettings() {
    settingState = SettingsState.visible;
    notifyListeners();
  }

  void hideSettings() {
    settingState = SettingsState.hide;
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

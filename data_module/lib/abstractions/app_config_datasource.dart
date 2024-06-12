import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppConfigDataSource {

  void setDarkMode(bool isDark);

  // Return a provider to allow UI to listen to change
  Provider<bool> getDarkMode();
}

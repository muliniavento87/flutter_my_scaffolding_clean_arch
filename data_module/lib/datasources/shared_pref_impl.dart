import 'package:data_module/data_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefImpl implements SharedPrefDataSource {
  late final SharedPreferences sharedPreferences;

  SharedPrefImpl();

  @override
  bool isCurrentThemeDark() {
    return sharedPreferences.getBool(SharedPreferencesKey.isThemeDark) ?? false;
  }

  @override
  void saveThemeSelection(bool isDark) {
    sharedPreferences.setBool(SharedPreferencesKey.isThemeDark, isDark);
  }

  @override
  Future<void> init() {
    return SharedPreferences
        .getInstance()
        .then(
            (value) => sharedPreferences = value
        );
  }
}


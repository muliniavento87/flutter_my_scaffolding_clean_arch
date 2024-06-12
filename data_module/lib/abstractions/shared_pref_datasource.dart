abstract class SharedPrefDataSource {

  Future<void> init();

  void saveThemeSelection(bool isDark);

  bool isCurrentThemeDark();
}

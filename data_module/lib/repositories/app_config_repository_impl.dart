import 'package:data_module/data_module.dart';
import 'package:domain_module/repo/app_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfigRepositoryImpl extends AppConfigRepository {
  SharedPrefDataSource sharedPrefDataSource;
  AppConfigDataSource appConfigDataSource;
  ProviderRef ref;

  AppConfigRepositoryImpl(this.ref, {required this.sharedPrefDataSource, required this.appConfigDataSource});

  @override
  Future<void> init() {
    return sharedPrefDataSource.init();
  }

  @override
  void updateTheme(bool isDark) {
    sharedPrefDataSource.saveThemeSelection(isDark);
    appConfigDataSource.setDarkMode(isDark);
  }

  @override
  Provider<bool> isDarkModeProvider() {
    return appConfigDataSource.getDarkMode();
  }
}

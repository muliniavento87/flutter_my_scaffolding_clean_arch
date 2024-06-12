import 'package:data_module/data_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfigDataSourceImpl implements AppConfigDataSource {
  ProviderRef ref;
  AppConfigDataSourceImpl(this.ref);

  @override
  void setDarkMode(bool isDark) {
    final appC = ref.read(appConfigProvider.notifier);
    appC.state = appC.state.copyWith(isDark: isDark);
  }

  @override
  Provider<bool> getDarkMode() {
    return _isDarkModeProvider;
  }
}

final _isDarkModeProvider = Provider<bool>((ref) {
  return ref.watch(appConfigProvider).isDark;
});
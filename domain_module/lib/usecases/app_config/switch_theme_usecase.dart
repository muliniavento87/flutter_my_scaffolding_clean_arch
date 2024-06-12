import 'package:domain_module/repo/app_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchThemeUseCase {
  AppConfigRepository appConfigRepository;

  SwitchThemeUseCase(this.appConfigRepository);

  void call(ref) {
    var isDark = ref.read(appConfigRepository.isDarkModeProvider());
    appConfigRepository.updateTheme(isDark ? false : true);
  }
}

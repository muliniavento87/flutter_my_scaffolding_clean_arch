import 'package:domain_module/repo/app_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetThemeStatusUseCase {
  AppConfigRepository appConfigRepository;

  GetThemeStatusUseCase(this.appConfigRepository);

  Provider<bool> call() {
    return appConfigRepository.isDarkModeProvider();
  }
}

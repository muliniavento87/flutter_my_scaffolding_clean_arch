[<- Back](../README.md)

# Scheletro domain_module

# REPO

## domain_module/lib/repo/app_config_repository.dart
Modelli astratti dei repository del data_module (config app, es. tema)
```
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppConfigRepository {
  Future<void> init();

  void updateTheme(bool isDark);

  Provider<bool> isDarkModeProvider();
}
```

## domain_module/lib/repo/api_rest_repository.dart
Modelli astratti dei repository del data_module (config app, es. tema)
```
abstract class ApiRestRepository {

  Future<String> getData();
}
```

# USECASES

## domain_module/lib/usecases/get_theme_status_usecase.dart
```
import 'package:domain_module/repo/app_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetThemeStatusUseCase {
  AppConfigRepository appConfigRepository;

  GetThemeStatusUseCase(this.appConfigRepository);

  Provider<bool> call() {
    return appConfigRepository.isDarkModeProvider();
  }
}
```

## domain_module/lib/usecases/switch_theme_usecase.dart
```
import 'package:domain_module/repo/app_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchThemeUseCase {
  AppConfigRepository appConfigRepository;

  SwitchThemeUseCase(this.appConfigRepository);

  void call(Ref ref) {
    var isDark = ref.read(appConfigRepository.isDarkModeProvider());
    appConfigRepository.updateTheme(isDark ? false : true);
  }
}
```
[<- Back](../README.md)

# Scheletro Data layer

# ENV

## data_module/lib/env/config.dart
```
abstract class Config {
  final String baseUrl = "";
}
```

## data_module/lib/env/config_dev.dart
```
import 'config.dart';

class ConfigDev implements Config {
  @override
  String get baseUrl => "https://google.com/"; //TODO
}
```

## data_module/lib/env/config_mock.dart
```
import 'config.dart';

class ConfigMock implements Config {
  @override
  String get baseUrl => "https://google.com/"; //TODO
}
```

## data_module/lib/env/config_prod.dart
```
import 'config.dart';

class ConfigProd implements Config {
  @override
  String get baseUrl => "https://google.com/"; //TODO
}
```

# FLAVORS

## data_module/lib/flavors.dart
```
import 'package:common_module/theme/app_theme.dart';
import 'package:common_module/theme/basic_theme.dart';
import 'package:data_module/env/config.dart';
import 'package:data_module/env/config_dev.dart';
import 'package:data_module/env/config_mock.dart';
import 'package:data_module/env/config_prod.dart';

enum Flavor { mock, dev, prod }

class F {
  static late Flavor appFlavor;

  static Config get config {
    switch (appFlavor) {
      case Flavor.mock:
        return ConfigMock();
      case Flavor.dev:
        return ConfigDev();
      case Flavor.prod:
        return ConfigProd();
    }
  }

  static BasicTheme get theme {
    //if (appFlavor == Flavor.prod)
    return AppTheme();
  }
}
```

# ABSTRACTIONS

## data_module/lib/abstractions/app_config_datasource.dart
```
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppConfigDataSource {

  void setDarkMode(bool isDark);

  // Return a provider to allow UI to listen to change
  Provider<bool> getDarkMode();
}
```

## data_module/lib/abstractions/shared_pref_datasource.dart
```
abstract class SharedPrefDataSource {

  Future<void> init();

  void saveThemeSelection(bool isDark);

  bool isCurrentThemeDark();
}
```

## data_module/lib/abstractions/api_rest_datasource.dart
```
abstract class ApiRestDataSource {
  Future<String> getData();
}
```

# DATASOURCES

## data_module/lib/datasources/shared_pref_impl.dart
```
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
```

## data_module/lib/datasources/app_config_datasource_impl.dart
```
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
```

## data_module/lib/datasources/api_rest_datasource_impl.dart
```
import 'package:data_module/data_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiRestDataSourceImpl implements ApiRestDataSource {
  ProviderRef ref;
  Dio client;

  ApiRestDataSourceImpl(this.ref, {required this.client});

    @override
    Future<String> getData() async {
      return "getData";
    }
}
```

# MODELS

## data_module/lib/models/app_config_state
Stato per provider
```
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_config_state.freezed.dart';

@freezed
class AppConfigState with _$AppConfigState {
  const factory AppConfigState({
    required bool isDark
  }) = _AppConfigState;
}
```

# DI (Dependency injections)
Providers di datasources e repositories

## data_module/lib/di/providers/di_app_config_provider.dart
```
import 'package:data_module/data_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  AppConfigState could be put inside AppConfigDataSourceImpl as a field.
//  Because UI is interested in listening to theme switch, a provider must be returned
//  for field isDark.
//  So, first create a StateProvider to wrap an AppConfigState instance and then
//  narrow the listening to only isDark field with a second provider that trigger
//  only when isDark is changed
final appConfigProvider = StateProvider((ref) =>
    AppConfigState(
        isDark: ref.read(sharedPrefDataSourceProvider).isCurrentThemeDark()
    ));

final appConfigDataSourceProvider = Provider<AppConfigDataSource>((ref) {
  return AppConfigDataSourceImpl(ref);
});
```

## data_module/lib/di/providers/di_shared_pref_provider.dart
Providers per servizi e datasources
```
import 'package:data_module/data_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ----- Shared Area app -----

/// provider servizio di datasource shared_preferences
final sharedPrefDataSourceProvider = Provider<SharedPrefDataSource>((ref) {
  return SharedPrefImpl();
});
```

## data_module/lib/di/providers/di_api_rest_provider.dart
```
import 'package:data_module/data_module.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// provider servizio di datasource shared_preferences
final apiRestDataSourceProvider = Provider<ApiRestDataSource>((ref) {
  return ApiRestDataSourceImpl(
    ref,
    client: Dio()
      ..options.baseUrl = F.config.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..interceptors.add(AwesomeDioInterceptor(
        logRequestTimeout: F.appFlavor != Flavor.prod,
        logRequestHeaders: F.appFlavor != Flavor.prod,
        logResponseHeaders: F.appFlavor != Flavor.prod,
      ))
  );
});
```

## data_module/lib/di/di_repository.dart
Repositories data_module esposti all'esterno
```
import 'package:data_module/data_module.dart';
import 'package:data_module/di/providers/di_api_rest_provider.dart';
import 'package:data_module/repositories/api_rest_repository_impl.dart';
import 'package:domain_module/repo/api_rest_repository.dart';
import 'package:domain_module/repo/app_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Repositories del data_module (espongono
/// le risorse con i providers)

//to manage base app configuration
final appConfigRepositoryProvider = Provider<AppConfigRepository>((ref) {
  return AppConfigRepositoryImpl(
      ref,
      sharedPrefDataSource: ref.read(sharedPrefDataSourceProvider),
      appConfigDataSource: ref.read(appConfigDataSourceProvider)
  );
});

///
final apiRestRepositoryProvider = Provider<ApiRestRepository>((ref) {
  return ApiRestRepositoryImpl(
    ref,
    apiRestDatasource: ref.read(apiRestDataSourceProvider),
    //ref.read(shopDatasourceProvider)
  );
});
```

## data_module/lib/di/di_override_providers.dart
```
import 'package:data_module/data_module.dart';
import 'package:data_module/di/providers/di_api_rest_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Override overrideShopApiDataSourceProvider(ApiRestDataSource override) {
  return apiRestDataSourceProvider.overrideWithValue(override);
}
```

# REPOSITORIES

## data_module/lib/repositories/app_config_repository_impl.dart
Servizio di shared_preferences per tutta l'app
```
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
```

## data_module/lib/repositories/api_rest_repository_impl.dart
```
import 'package:data_module/data_module.dart';
import 'package:domain_module/repo/api_rest_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiRestRepositoryImpl extends ApiRestRepository {
  ApiRestDataSource apiRestDatasource;
  ProviderRef ref;

  ApiRestRepositoryImpl(this.ref, {required this.apiRestDatasource});

  @override
  Future<String> getData() {
    return apiRestDatasource.getData();
  }
}
```

# CONSTANTS

## lib/constants/shared_preferences_key.dart
```
class SharedPreferencesKey {
  static const String isThemeDark = 'isThemeDark';
}
```

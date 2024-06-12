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
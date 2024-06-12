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
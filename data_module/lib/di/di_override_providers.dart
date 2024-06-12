import 'package:data_module/data_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Override overrideShopApiDataSourceProvider(ApiRestDataSource override) {
  return apiRestDataSourceProvider.overrideWithValue(override);
}
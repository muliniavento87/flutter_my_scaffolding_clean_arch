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
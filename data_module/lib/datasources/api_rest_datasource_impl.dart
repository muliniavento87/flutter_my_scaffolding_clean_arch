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



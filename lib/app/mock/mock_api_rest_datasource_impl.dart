import 'package:data_module/data_module.dart';

class MockApiRestDataSourceImpl implements ApiRestDataSource {
  MockApiRestDataSourceImpl();

  @override
  Future<String> getData() {
    return Future.delayed(const Duration(seconds: 2), () => "mocked result"); // Simulate network delay
  }
}
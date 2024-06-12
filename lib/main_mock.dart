import 'package:data_module/data_module.dart';
import 'app/mock/mock_api_rest_datasource_impl.dart';
import 'app/main.dart';

void main() async {
  F.appFlavor = Flavor.mock;
  appMain(overrides: [
    overrideShopApiDataSourceProvider(MockApiRestDataSourceImpl()) // datasource override example
  ]);
}
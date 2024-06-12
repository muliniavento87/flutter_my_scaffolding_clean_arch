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
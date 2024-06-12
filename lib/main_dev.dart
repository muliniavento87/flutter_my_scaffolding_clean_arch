import 'package:data_module/data_module.dart';
import 'app/main.dart';

// COnfig_additional_args:  --flavor=dev -t lib/main_dev.dart
void main() async {
  F.appFlavor = Flavor.dev;
  appMain(overrides: []);
}
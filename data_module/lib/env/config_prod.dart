import 'config.dart';

/// [Config] is the abstract class describing the configurations data
///
/// Each implementation is based on the environment
class ConfigProd implements Config {

  @override
  String get baseUrl => "https://google.com/"; //TODO
}
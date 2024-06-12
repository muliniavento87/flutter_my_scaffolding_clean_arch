import 'package:data_module/data_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// AppConfigState could be put inside AppConfigDataSourceImpl as a field.
// Because UI is interested in listening to theme switch, a provider must be returned
// for field isDark.
// So, first create a StateProvider to wrap an AppConfigState instance and then
// narrow the listening to only isDark field with a second provider that trigger
// only when isDark is changed
final appConfigProvider = StateProvider((ref) =>
    AppConfigState(
        isDark: ref.read(sharedPrefDataSourceProvider).isCurrentThemeDark()
    ));

final appConfigDataSourceProvider = Provider<AppConfigDataSource>((ref) {
  return AppConfigDataSourceImpl(ref);
});

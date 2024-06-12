import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppConfigRepository {
  Future<void> init();

  void updateTheme(bool isDark);

  Provider<bool> isDarkModeProvider();
}
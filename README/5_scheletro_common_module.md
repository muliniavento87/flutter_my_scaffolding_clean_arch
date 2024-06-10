[<- Back](../README.md)

# Scheletro common_module

## "common_module/lib/theme/basic_theme.dart"
Modello astratto
```
import 'package:flutter/material.dart';

abstract class BasicTheme {

  final Color colorScaffold = MaterialColorGenerator.from(const Color(0xFFF4F4F4));

  final Color secondaryColor = const Color(0xFF2A2E6A);

  final ThemeData themeData = ThemeData();

  final ThemeData darkThemeData = ThemeData();
}

///
class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}
```
## "lib/theme/app_theme.dart"
Implementazione
```
import 'package:common_module/theme/basic_theme.dart';
import 'package:flutter/material.dart';

class AppTheme extends BasicTheme {

  @override
  Color get colorScaffold => const Color(0xFFAAAAAA);

  @override
  Color get secondaryColor => const Color(0xFF2A2E6A);

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        scaffoldBackgroundColor: colorScaffold,
        iconTheme: IconThemeData(color: secondaryColor),
        textTheme: TextTheme(headlineSmall: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor), titleLarge: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor)),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(32))),
        ),
      );

  @override
  ThemeData get darkThemeData => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: colorScaffold,
        iconTheme: IconThemeData(color: secondaryColor),
        textTheme: TextTheme(headlineSmall: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor), titleLarge: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor)),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(32))),
        ),
      );
}
```
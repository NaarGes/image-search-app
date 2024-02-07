import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightThemeBuilder(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(),
        textTheme: const TextTheme(bodySmall: TextStyle(fontWeight: FontWeight.w600)),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: MaterialStateProperty.all(
            Colors.grey[300],
          ),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          hintStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      );

  static ThemeData darkThemeBuilder(BuildContext context) => ThemeData();
}

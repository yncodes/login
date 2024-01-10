import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_schemes.dart';

class AppTheme {
  static ThemeData lightTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      fontFamily: "Inter",
      menuTheme: MenuThemeData(
        style: MenuStyle(
          shadowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return Colors.black26;
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double?>(
                (Set<MaterialState> states) {
              return 8;
            },
          ),
          surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return lightColorScheme.primaryContainer;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return lightColorScheme.primaryContainer;
            },
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          foregroundColor: lightColorScheme.primary),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            disabledBackgroundColor: lightColorScheme.primary,
            disabledForegroundColor: lightColorScheme.onPrimary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          )),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10),
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE4EDF6)),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE4EDF6)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE4EDF6)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true, colorScheme: darkColorScheme, fontFamily: "Inter");
  }
}

import 'package:authors_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme => ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: ScreenBackgroundLight.primary,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: InputCursor.primaryCursor,
          selectionHandleColor: InputCursor.primarySelectionHandle,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          fillColor: InputLight.primaryBackground,
          filled: true,
          labelStyle:
              const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 26.0, vertical: 12.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            minimumSize: const Size(74, 32),
            elevation: 0,
            backgroundColor: ElevatedButtonLight.primaryBackground,
            side: const BorderSide(
                color: ElevatedButtonLight.primaryBorder, width: 3),
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          ),
        ),
      );
}

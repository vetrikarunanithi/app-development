import 'package:flutter/material.dart';

class AppColors {
  static const Color accent = Color(0xFFFF5757);
  static const Color lightAccent = Color(0xFFFFE7E7);
  static const Color bg = Colors.white;
  static const Color text = Colors.black;
  static const Color textDark = Color(0xFF1E1E1E); // <- added
  static const Color subtext = Colors.black54;
  static const Color chipBg = Color(0xFFF5F6FA);
}

ThemeData buildTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      primary: AppColors.accent,
    ),
    scaffoldBackgroundColor: AppColors.bg,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.text),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.subtext),
    ),
    useMaterial3: true,
  );
}

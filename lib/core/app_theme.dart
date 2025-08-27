import 'package:flutter/material.dart';

// 색상 정의
final Color primaryColor = Colors.blue;
final Color cardColor = Colors.white;
final Color scaffoldBackgroundColor = Colors.grey.shade100;

// 테마 정의
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: scaffoldBackgroundColor,

  // AppBar 테마
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    toolbarTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  ),

  // Card 테마
  // cardTheme: CardTheme(
  //   color: cardColor,
  //   elevation: 2,
  //   surfaceTintColor: null, // nullable 처리
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //   margin: const EdgeInsets.all(8),
  // ),

  // ElevatedButton 테마
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
    ),
  ),

  // TextTheme (Material3 기준)
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 14),
  ),
);

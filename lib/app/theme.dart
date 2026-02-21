import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(0, 12, 16, 154), // azul base
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}

import 'package:flutter/material.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF16A34A),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF4F7FB),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: appRouter,
    );
  }
}

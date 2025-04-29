import 'package:flutter/material.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:guitar_codes_app/services/settings_service.dart';
import 'package:guitar_codes_app/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesService()),
        ChangeNotifierProvider(create: (_) => SettingsService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsService = Provider.of<SettingsService>(context);

    return MaterialApp(
      title: 'Guitar Codes',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      themeMode:
          settingsService.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }

  ThemeData lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFBF5F3),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF43C59E),
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF646E78),
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF0F0E0E)),
        bodyMedium: TextStyle(color: Color(0xFF646E78)),
      ),
      useMaterial3: true,
    );
  }

  ThemeData darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF0F0E0E),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF43C59E),
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF646E78),
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFFBF5F3)),
        bodyMedium: TextStyle(color: Color(0xFFCCCCCC)),
      ),
      useMaterial3: true,
    );
  }
}

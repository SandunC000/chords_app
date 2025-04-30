import 'package:flutter/material.dart';
import 'package:guitar_codes_app/services/favorites_service.dart';
import 'package:guitar_codes_app/services/settings_service.dart';
import 'package:guitar_codes_app/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsService()),
        ChangeNotifierProvider(create: (_) => FavoritesService()),
      ],
      child: const MyApp(),
    ),
  );
}

class AppColors {
  // Shared primary color (green-based, soft)
  static const primary = Color(0xFF4CAF50);
  static const primaryDark = Color(0xFF81C784);

  // Light theme
  static const lightBackground = Color(0xFFF9FAFB);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightPrimaryText = Color(0xFF1F2937);
  static const lightSecondaryText = Color(0xFF6B7280);

  // Dark theme
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkPrimaryText = Color(0xFFF9FAFB);
  static const darkSecondaryText = Color(0xFF9CA3AF);

  static const appBarColor = Color(0xFF2F855A);
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
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: Colors.teal,
        onSecondary: Colors.white,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightPrimaryText,
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarColor,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: AppColors.lightPrimaryText),
        bodyMedium:
            TextStyle(fontSize: 16, color: AppColors.lightSecondaryText),
      ),
      useMaterial3: true,
    );
  }

  ThemeData darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: Colors.black,
        secondary: Colors.tealAccent,
        onSecondary: Colors.black,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkPrimaryText,
        error: Colors.red[400]!,
        onError: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarColor,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: AppColors.darkPrimaryText),
        bodyMedium: TextStyle(fontSize: 16, color: AppColors.darkSecondaryText),
      ),
      useMaterial3: true,
    );
  }
}

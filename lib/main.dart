//main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const DeveliyApp());
}

class DeveliyApp extends StatelessWidget {
  const DeveliyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'develiy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFA8D8EA), // Main color - soft baby blue
          secondary: Color(0xFFD4ECF7), // Lighter variant
          tertiary: Color(0xFF7FC4DD), // Darker variant
          surface: Colors.white,
          background: Color(0xFFFDFDFD),
          onPrimary: Colors.white,
          onSecondary: Color(0xFF2C3E50),
          onSurface: Color(0xFF2C3E50),
        ),
        scaffoldBackgroundColor: const Color(0xFFFDFDFD),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA8D8EA),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: const Color(0xFFA8D8EA).withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFA8D8EA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFFA8D8EA).withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFA8D8EA), width: 2),
          ),
          labelStyle: const TextStyle(
            color: Color(0xFF7A8A99),
          ),
          hintStyle: TextStyle(
            color: const Color(0xFF7A8A99).withOpacity(0.6),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA8D8EA),
            foregroundColor: Colors.white,
            elevation: 2,
            shadowColor: const Color(0xFFA8D8EA).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFA8D8EA),
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF2C3E50),
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF2C3E50),
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF2C3E50),
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF2C3E50),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6B9FB5), // Soft muted blue - tidak neon
          secondary: Color(0xFF527B8E), // Darker muted blue
          tertiary: Color(0xFF7BA9BE), // Slightly lighter variant
          surface: Color(0xFF1A1F25), // Dark grey-blue surface
          background: Color(0xFF12161B), // Very dark background
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFD5E3E9), // Soft light blue-grey text
          onSurface: Color(0xFFD5E3E9), // Soft light blue-grey text
        ),
        scaffoldBackgroundColor: const Color(0xFF12161B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1F25),
          foregroundColor: Color(0xFFD5E3E9),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFD5E3E9),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: const Color(0xFF1A1F25),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1A1F25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF6B9FB5).withOpacity(0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF6B9FB5).withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF6B9FB5), width: 2),
          ),
          labelStyle: TextStyle(
            color: const Color(0xFFD5E3E9).withOpacity(0.7),
          ),
          hintStyle: TextStyle(
            color: const Color(0xFFD5E3E9).withOpacity(0.4),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6B9FB5),
            foregroundColor: Colors.white,
            elevation: 2,
            shadowColor: const Color(0xFF6B9FB5).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF6B9FB5),
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFFD5E3E9),
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFFD5E3E9),
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFFD5E3E9),
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFD5E3E9),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
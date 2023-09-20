import 'package:flutter/material.dart';
import 'package:expense_planner/widgets/expenses.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp],
  // ).then((_) {});
  runApp(const MyApp());
}

// colorScheme for light theme
var colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 87, 55, 160),
);

// colorScheme for dark theme
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// theme for card
  CardTheme _cardTheme(ColorScheme color) {
    return const CardTheme().copyWith(
      color: color.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
    );
  }

// theme for button
  ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme eColor) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: eColor.primaryContainer,
      foregroundColor: eColor.onPrimaryContainer,
    ));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: _cardTheme(kDarkColorScheme),
        elevatedButtonTheme: _elevatedButtonTheme(kDarkColorScheme),
      ),
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: colorScheme.onPrimaryContainer,
            foregroundColor: colorScheme.primaryContainer),
        cardTheme: _cardTheme(colorScheme),
        elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: const Expenses(title: 'Expense Tracker'),
      debugShowCheckedModeBanner: false,
    );
  }
}

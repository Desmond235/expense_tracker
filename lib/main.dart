import 'package:flutter/material.dart';
import 'package:expense_planner/widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var colorScheme = ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 87, 55, 160)
        );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const Expenses(title: 'Expense Tracker'),
      debugShowCheckedModeBanner: false,
    );
  }
}

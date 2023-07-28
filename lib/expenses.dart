import 'package:flutter/material.dart';

import 'package:expense_planner/model/expense_list.dart';
import 'package:expense_planner/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.title});
  final String title;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "I'm a man of God",
      amount: 23.41,
      date: DateTime.now(),
    ),
     Expense(
      title: "Flutter is the best",
      amount: 13.35,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Get ready",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          ExpenseList(expenses: _registeredExpenses)
        ],
      ),
    );
  }
}

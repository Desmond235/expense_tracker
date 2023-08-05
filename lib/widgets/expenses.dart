import 'package:expense_planner/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/widgets/expense_list/expense_list.dart';
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
        category: Category.food),
    Expense(
        title: "Flutter is the best",
        amount: 13.35,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openBtmSheet() {
    showModalBottomSheet(
       showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openBtmSheet,
            tooltip: "Add expense",
          ),
        ],
      ),
      body: Column(
        children: [
          ExpenseList(expenses: _registeredExpenses)
        ],
      ),
    );
  }
}

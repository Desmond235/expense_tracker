import 'package:flutter/material.dart';
import 'package:expense_planner/model/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Text(expenses[index].title),
        );
      },
      itemCount: expenses.length,
      ),
    );
  }
}

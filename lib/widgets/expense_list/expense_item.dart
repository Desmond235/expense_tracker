import 'package:expense_planner/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{Key? key}) : super(key: key);

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(expense.title),
    );
  }
}
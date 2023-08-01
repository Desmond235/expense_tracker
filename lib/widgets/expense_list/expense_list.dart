import 'package:expense_planner/widgets/expense_list/expense_item.dart';
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
        return ExpenseItem(expenses[index]);
      },
      itemCount: expenses.length,
      ),
    );
  }
}

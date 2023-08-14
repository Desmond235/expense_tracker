import 'package:expense_planner/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/model/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  void reOrder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final item = expenses.removeAt(oldIndex);
    expenses.insert(newIndex, item);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 580,
      child: ReorderableListView.builder(
        itemBuilder: (context, index) {
          //  this widget is used for deleting an expense
          return Dismissible(
            background: Card(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                vertical: 7
              ),
              child: const ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                  size: 25,
                ),
                trailing: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]),
          );
        },
        onReorder: reOrder,
        itemCount: expenses.length,
      ),
    );
  }
}

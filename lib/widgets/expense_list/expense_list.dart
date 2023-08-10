import 'package:expense_planner/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/model/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  void reOrder(int oldIndex , int newIndex){
    if (oldIndex < newIndex){
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
          return Dismissible(
            
            background: Card(
              elevation: 0,
              color: const Color.fromARGB(255, 248, 52, 38),
              child: Container(
                margin: const EdgeInsets.only(top: 25),
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

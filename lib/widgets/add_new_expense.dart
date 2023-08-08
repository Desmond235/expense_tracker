import 'package:expense_planner/model/expense.dart';
import 'package:flutter/material.dart';

class AddNewExpense extends StatelessWidget {
  const AddNewExpense({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.selectedDate,
    required this.datePicker,
    required this.chosenCategory,
    required this.submitExpense,
    required this.onSelectedCategory
  });

  final TextEditingController titleController;
  final TextEditingController amountController;
  final DateTime? selectedDate;
  final void Function() datePicker;
  final void Function(dynamic value) chosenCategory;
  final void Function() submitExpense;
  final Category onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextField(
            maxLength: 60,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$\t",
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null
                        ? 'No date chosen'
                        : formater.format(selectedDate!)),
                    IconButton(
                      onPressed: datePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                      tooltip: "Choose date",
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(   
            children: [
              const SizedBox(
                width: 10,
              ),      
              DropdownButton(
                value: onSelectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: chosenCategory,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: submitExpense,
                child: const Text('save expenses'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:expense_planner/model/expense.dart';
import 'package:flutter/material.dart';

class AddNewExpense extends StatelessWidget {
  const AddNewExpense(
      {super.key,
      required this.titleController,
      required this.amountController,
      required this.selectedDate,
      required this.datePicker,
      required this.chosenCategory,
      required this.submitExpense,
      required this.onSelectedCategory});

  final TextEditingController titleController;
  final TextEditingController amountController;
  final DateTime? selectedDate;
  final void Function() datePicker;
  final void Function(dynamic value) chosenCategory;
  final void Function() submitExpense;
  final Category onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    // variable for title
    final titleTextField = TextField(
      maxLength: 60,
      controller: titleController,
      decoration: const InputDecoration(
        label: Text('Title'),
      ),
    );

    // variable for amount
    final amountTextField = TextField(
      controller: amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixText: "\$\t",
        label: Text('Amount'),
      ),
    );

// dropdown
    final dropDown = DropdownButton(
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
    );

    // datepicker
    final pickDate = Expanded(
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
    );

    // save expenses
    final btnSave = ElevatedButton(
      onPressed: submitExpense,
      child: const Text('save expenses'),
    );

    //  cancel -(TextButton)
    final btnCancel = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      return Expanded(
        child: Column(
          children: [
            if (width >= 600)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: titleTextField),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: amountTextField)
                ],
              )
            else
              titleTextField,
            if (width >= 600)
              Row(
                children: [
                  dropDown,
                  const SizedBox(width: 24),
                  pickDate,
                ],
              )
            else
              Row(
                children: [
                  Expanded(child: amountTextField),
                  const SizedBox(
                    width: 15,
                  ),
                  pickDate
                ],
              ),
            const SizedBox(height: 10),
            if (width >= 600)
              Row(
                children: [
                  const Spacer(),
                  btnSave,
                  btnCancel,
                ],
              )
            else
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  dropDown,
                  const Spacer(),
                  btnSave,
                  btnCancel,
                ],
              )
          ],
        ),
      );
    });
  }
}

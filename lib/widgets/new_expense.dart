import 'package:flutter/material.dart';
import 'package:expense_planner/model/expense.dart';
import 'package:expense_planner/widgets/add_new_expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _chosenDate;

  Category _selectedCategory = Category.leisure;
 
 //Method for showiing datepicker
  void _datePicker() async {
    final todayDate = DateTime.now();
    final firstDate =
        DateTime(todayDate.year - 1, todayDate.month, todayDate.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: firstDate,
        lastDate: todayDate);
    setState(() {
      _chosenDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
    
    // adding expense 
  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        isAmountInvalid ||
        _chosenDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount,and category is entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }

    // This add new expenses 
    widget.addExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _chosenDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  void _chosenCategory(value) {
    if (value == null) {
      return;
    }
    setState(() {
      _selectedCategory = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AddNewExpense(
            titleController: _titleController,
            amountController: _amountController,
            selectedDate: _chosenDate,
            datePicker: _datePicker,
            chosenCategory: _chosenCategory,
            submitExpense: _submitExpense,
            onSelectedCategory: _selectedCategory,
          )
        ],
      ),
    );
  }
}

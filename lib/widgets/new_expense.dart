 import 'package:flutter/material.dart';

 class NewExpense extends StatefulWidget {
   const NewExpense({super.key});
 
   @override
   State<NewExpense> createState() => _NewExpenseState();
 }
 
 class _NewExpenseState extends State<NewExpense> {
   @override
   Widget build(BuildContext context) {
     return const Padding(padding: EdgeInsets.all(16),
     child: TextField(
      maxLength: 60,
      decoration: InputDecoration(label: Text('Title')),
     ),
     );
   }
 }
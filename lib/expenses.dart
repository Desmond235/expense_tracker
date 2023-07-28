import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.title});
  final String title;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
        style: const  TextStyle(
          fontWeight: FontWeight.w500
        ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          const Center(
             child: Text(
              "Get ready",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
                     ),
           ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 200,
            child: const Placeholder( 
              child: Center(child: Text('Expenses')),
            ),
          )
        ],
      ),
    );
  }
}

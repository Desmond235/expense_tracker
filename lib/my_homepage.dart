import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title,
        style: const  TextStyle(
          fontWeight: FontWeight.w500
        ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: const Center(
        child: Text(
          "Get ready",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

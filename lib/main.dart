import 'package:flutter/material.dart';
import 'package:uni_expenses/widgets/expense_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpensePage(title: 'College expenses'),
    );
  }
}

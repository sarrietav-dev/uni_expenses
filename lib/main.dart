import 'package:flutter/material.dart';
import 'package:uni_expenses/widgets/expense_input.dart';

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
      home: const MyHomePage(title: 'College expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, double> _expenses = {};

  get getTotalPrice {
    return _expenses.values.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpenseInput(
            icon: const Icon(Icons.bus_alert),
            expensePrice: 2700,
            onChanged: (price) {
              setState(() {
                _totalPrice = price;
              });
            },
          ),
          Text("\$$getTotalPrice")
        ],
      ),
    );
  }
}

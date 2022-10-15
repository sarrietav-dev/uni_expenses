import 'package:flutter/material.dart';
import 'package:uni_expenses/constants/routes.dart';
import 'expense_input.dart';

class ExpensePage extends StatefulWidget {
  final String title;

  const ExpensePage({super.key, required this.title});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final Map<String, double> _expenses = {};

  get getTotalPrice {
    return _expenses.values.isEmpty
        ? 0
        : _expenses.values.reduce((value, element) => value + element);
  }

  void handleInputChange(double price, String key) {
    setState(() {
      _expenses[key] = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoute.settings.route),
            icon: const Icon(Icons.settings))
      ]),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        verticalDirection: VerticalDirection.up,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _InputLayoutWrapper(
                child: ExpenseInput(
                  icon: const Icon(Icons.bus_alert),
                  expensePrice: 2700,
                  onChanged: (price) => handleInputChange(price, "food"),
                ),
              ),
              _InputLayoutWrapper(
                child: ExpenseInput(
                    icon: const Icon(Icons.restaurant),
                    expensePrice: 10000,
                    onChanged: ((price) => handleInputChange(price, "bus"))),
              )
            ],
          ),
          Text(
            "\$$getTotalPrice",
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}

class _InputLayoutWrapper extends StatelessWidget {
  const _InputLayoutWrapper({required this.child});

  final ExpenseInput child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50), child: child),
    );
  }
}

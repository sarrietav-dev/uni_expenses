import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
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
                  onChanged: (price) {
                    setState(() {
                      _expenses["bus"] = price;
                    });
                  },
                ),
              ),
              _InputLayoutWrapper(
                child: ExpenseInput(
                  icon: const Icon(Icons.restaurant),
                  expensePrice: 10000,
                  onChanged: (price) {
                    setState(() {
                      _expenses["food"] = price;
                    });
                  },
                ),
              )
            ],
          ),
          Text(
            "\$$getTotalPrice",
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

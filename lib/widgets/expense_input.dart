import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseInput extends StatelessWidget {
  const ExpenseInput(
      {super.key,
      required this.icon,
      required this.expensePrice,
      required this.onChanged});

  final Icon icon;
  final double expensePrice;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        double priceValue = expensePrice * int.parse(value == '' ? '0' : value);
        onChanged(priceValue);
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          icon: icon, border: const OutlineInputBorder()),
    );
  }
}

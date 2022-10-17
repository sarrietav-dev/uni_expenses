import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni_expenses/widgets/expense_input.dart';

void main() {
  testWidgets("Returns the correct price", (tester) async {
    var testPrice = 0.0;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ExpenseInput(
            icon: const Icon(Icons.abc),
            expensePrice: 2700,
            onChanged: (price) => testPrice = price),
      ),
    ));

    await tester.enterText(find.byType(TextField), "2");

    expect(testPrice, 5400);
  });
}

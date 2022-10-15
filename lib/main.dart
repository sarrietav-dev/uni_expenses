import 'package:flutter/material.dart';
import 'package:uni_expenses/constants/routes.dart';
import 'package:uni_expenses/pages/settings_page.dart';
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
      routes: {
        AppRoute.home.route: (context) =>
            const ExpensePage(title: "College expenses"),
        AppRoute.settings.route: (context) => const SettingsPage(),
      },
    );
  }
}

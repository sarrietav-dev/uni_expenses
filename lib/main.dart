import 'package:flutter/material.dart';
import 'package:uni_expenses/constants/routes.dart';
import 'package:uni_expenses/pages/settings_page.dart';
import 'package:uni_expenses/pages/expense_page.dart';
import 'package:uni_expenses/services/local_storage_settings_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoute.home.route: (context) =>
            const ExpensePage(title: "College expenses"),
        AppRoute.settings.route: (context) =>
            SettingsPage(settingsService: LocalStorageSettingService()),
      },
    );
  }
}

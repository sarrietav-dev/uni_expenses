import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_expenses/constants/routes.dart';
import 'package:uni_expenses/models/setting_context.dart';
import 'package:uni_expenses/pages/settings_page.dart';
import 'package:uni_expenses/pages/expense_page.dart';
import 'package:uni_expenses/services/local_storage_settings_service.dart';
import 'package:uni_expenses/services/settings_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => LocalStorageSettingService(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ISettingsService _settingsService = LocalStorageSettingService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoute.home.route: (context) => FutureBuilder(
              future: _settingsService.getSettings(),
              builder: (BuildContext context,
                  AsyncSnapshot<SettingContext> snapshot) {
                if (snapshot.hasData) {
                  return ExpensePage(
                      title: "College Expenses", settings: snapshot.data!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
        AppRoute.settings.route: (context) =>
            SettingsPage(settingsService: LocalStorageSettingService()),
      },
    );
  }
}

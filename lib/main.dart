import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_expenses/constants/routes.dart';
import 'package:uni_expenses/models/setting_context.dart';
import 'package:uni_expenses/pages/settings_page.dart';
import 'package:uni_expenses/pages/expense_page.dart';
import 'package:uni_expenses/services/local_storage_settings_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => LocalStorageSettingService(), child: const MyApp()));
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
        AppRoute.home.route: (context) => Consumer<LocalStorageSettingService>(
              builder: (context, settingsService, child) => FutureBuilder(
                future: settingsService.getSettings(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ExpensePage(
                        title: "College expenses",
                        settings: snapshot.data as SettingContext);
                  } else {
                    return child!;
                  }
                },
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
        AppRoute.settings.route: (context) =>
            SettingsPage(settingsService: LocalStorageSettingService()),
      },
    );
  }
}

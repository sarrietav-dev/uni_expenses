import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_expenses/pages/settings_page.dart';
import 'package:uni_expenses/services/local_storage_settings_service.dart';

void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    var preferences = await SharedPreferences.getInstance();

    preferences.clear();
  });

  testWidgets("It saves the settings correctly", (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: SettingsPage(settingsService: LocalStorageSettingService())));

    var doubleRide = find.byKey(const Key("isDoubleRideSettingInput"));
    var busPrice = find.byKey(const Key("busPriceSettingInput"));

    await tester.tap(doubleRide);
    await tester.enterText(busPrice, "2000");

    var floatingActionButton = find.byType(FloatingActionButton);
    await tester.tap(floatingActionButton);

    var settingsService = LocalStorageSettingService();

    var settings = await settingsService.getSettings();

    expect(settings.busPrice, 2000);
    expect(settings.isDoubleRide, true);
  });
}

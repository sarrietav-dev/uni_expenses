import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_expenses/models/setting_context.dart';
import 'package:uni_expenses/services/local_storage_settings_service.dart';
import 'package:uni_expenses/services/settings_service.dart';

void main() {
  group("The local storage settings service", () {
    test("Gets the correct setting values", () async {
      ISettingsService settingsService = LocalStorageSettingService();

      await settingsService.saveSettings(SettingContext(busPrice: 1000, isDoubleRide: true));

      var settings = await settingsService.getSettings();

      expect(settings.busPrice, 1000);
      expect(settings.isDoubleRide, true);
    });

    test("Saves the settings correctly", () async {
      SharedPreferences.setMockInitialValues({});

      SharedPreferences preferences = await SharedPreferences.getInstance();

      ISettingsService settingsService = LocalStorageSettingService();

      await settingsService
          .saveSettings(SettingContext(busPrice: 2700, isDoubleRide: false));

      expect(jsonDecode(preferences.get("settings").toString()),
          {"busPrice": 2700, "isDoubleRide": false});
    });
  });
}

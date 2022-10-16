import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_expenses/models/setting_context.dart';
import 'package:uni_expenses/services/settings_service.dart';

class LocalStorageSettingService implements ISettingsService {
  @override
  Future<SettingContext> getSettings() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get("settings") != null
        ? SettingContext.fromJson(
            object: jsonDecode(sharedPreferences.get("settings").toString())
                as Map<String, dynamic>)
        : SettingContext(busPrice: 2700, isDoubleRide: false);
  }

  @override
  Future<void> saveSettings(SettingContext settings) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("settings", jsonEncode(settings.toJson()));
  }
}

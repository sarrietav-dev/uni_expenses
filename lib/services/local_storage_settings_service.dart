import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_expenses/models/setting_context.dart';
import 'package:uni_expenses/services/settings_service.dart';

class LocalStorageSettingService extends ChangeNotifier
    implements ISettingsService {
  late SettingContext _settings;

  @override
  Future<SettingContext> getSettings() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var settings = sharedPreferences.get("settings") != null
        ? SettingContext.fromJson(
            object: jsonDecode(sharedPreferences.get("settings").toString())
                as Map<String, dynamic>)
        : SettingContext(busPrice: 2700, isDoubleRide: false);

    _settings = settings;

    notifyListeners();
    return _settings;
  }

  @override
  Future<void> saveSettings(SettingContext settings) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("settings", jsonEncode(settings.toJson()));
    _settings = settings;
    notifyListeners();
  }
}

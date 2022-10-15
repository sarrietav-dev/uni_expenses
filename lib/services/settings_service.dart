import 'package:uni_expenses/models/setting_context.dart';

abstract class ISettingsService {
  Future<SettingContext> getSettings();
  Future<void> saveSettings(SettingContext settings);
}

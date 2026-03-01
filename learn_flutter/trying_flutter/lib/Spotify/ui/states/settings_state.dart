import 'package:flutter/widgets.dart';
 
import '../../model/settings/app_settings.dart';
import '../../data/repositories/settings/app_settings_repository.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository _repository;
  AppSettings? _appSettings;

  AppSettingsState(this._repository);

  Future<void> init() async {
    _appSettings = await _repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    final current = _appSettings ?? AppSettings(themeColor: themeColor);
    _appSettings = current.copyWith(themeColor: themeColor);
    await _repository.save(_appSettings!);
    notifyListeners();
  }
}

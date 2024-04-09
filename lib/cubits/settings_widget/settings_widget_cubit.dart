import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_widget_state.dart';

class SettingsWidgetCubit extends Cubit<SettingsWidgetState> {
  SettingsWidgetCubit()
      : super(
    const SettingsWidgetState(
      settingsNames: [],
      settingsValues: [],
    ),
  ) {
    saveSettingsWidgetValues(settingsWidgetKeys, settingsWidgetValues);
    readSettingsWidgetValues(settingsWidgetKeys);
  }

  Future<void> saveSettingsWidgetValues(List<String> keys, List<bool> values) async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < keys.length; i++) {
      final key = keys[i];
      final value = values[i];

      if (!prefs.containsKey(key)) {
        await StorageRepository.putBool(key, value);
      }
    }
  }

  Future<void> readSettingsWidgetValues(List<String> keys) async {
    final List<bool> values = [];

    for (int i = 0; i < keys.length; i++) {
      final value = StorageRepository.getBool(keys[i]);
      values.add(value);
    }
    emit(state.copyWith(settingsValues: values, settingsNames: keys));
  }

  Future<void> updateSettingsWidgetValues(String key, bool value, List<String> keys) async {
    StorageRepository.putBool(key, value);
    await readSettingsWidgetValues(keys);
  }
}
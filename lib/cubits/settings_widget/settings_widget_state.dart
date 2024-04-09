part of 'settings_widget_cubit.dart';

class SettingsWidgetState extends Equatable {
  final List<String> settingsNames;
  final List<bool> settingsValues;

  const SettingsWidgetState({
    required this.settingsNames,
    required this.settingsValues,
  });

  SettingsWidgetState copyWith({
    List<String>? settingsNames,
    List<bool>? settingsValues,
  }) {
    return SettingsWidgetState(
      settingsNames: settingsNames ?? this.settingsNames,
      settingsValues: settingsValues ?? this.settingsValues,
    );
  }

  @override
  List<Object?> get props => [
    settingsNames,
    settingsValues,
  ];
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
class SettingState {
  final bool theme;
  final bool daily;

  SettingState({this.theme = false, this.daily = false});

  SettingState copyWith({
    bool? theme,
    bool? daily,
  }) {
    return SettingState(
      theme: theme ?? this.theme,
      daily: daily ?? this.daily,
    );
  }
}

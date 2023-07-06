import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/setting/presentation/setting_state.dart';
import 'package:myfoody/src/services/services.dart';

class SettingNotifier extends StateNotifier<SettingState> {
  SettingNotifier() : super(SettingState()) {
    getTheme();
  }

  Future<void> getTheme() async {
    final shared = SharedManager<bool>();
    final value = await shared.read(SharedKey.darkTheme);
    state = state.copyWith(theme: value ?? false);
  }

  Future<void> setTheme(bool value) async {
    final shared = SharedManager<bool>();
    await shared.store(SharedKey.darkTheme, value);
    state = state.copyWith(theme: value);
  }

  Future<void> getDailyRestaurant() async {
    final shared = SharedManager<bool>();
    final value = await shared.read(SharedKey.daily);
    state = state.copyWith(daily: value ?? false);
  }

  Future<void> setDailyRestaurant(bool value) async {
    final shared = SharedManager<bool>();
    await shared.store(SharedKey.daily, value);
    state = state.copyWith(daily: value);
  }
}

final settingControllerProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, SettingState>((ref) {
  return SettingNotifier();
});

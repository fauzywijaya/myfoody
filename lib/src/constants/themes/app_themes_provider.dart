import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/services/services.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    getTheme();
  }

  Future<void> getTheme() async {
    final shared = SharedManager<bool>();
    final value = await shared.read("theme_mode");
    state = value ?? false;
  }

  Future<void> setTheme(bool value) async {
    final shared = SharedManager<bool>();
    await shared.story("theme_mode", value);
    state = value;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

final themesProviders = StateNotifierProvider<ThemesProvider, ThemeMode?>((_) {
  return ThemesProvider();
});

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider() : super(ThemeMode.system);
  void changeTheme(bool isOn) {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}

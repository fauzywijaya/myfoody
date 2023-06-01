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

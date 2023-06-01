import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/presentation.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState());

  void onChangeScreen(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController();
});

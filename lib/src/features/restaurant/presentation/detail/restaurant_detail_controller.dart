import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantDetailController extends StateNotifier<RestaurantDetailState> {
  final RestaurantService _restaurantService;
  RestaurantDetailController(this._restaurantService)
      : super(RestaurantDetailState());

  void fetchDetailRestaurant({required String restaurantId}) async {
    state = state.copyWith(restaurantDetailValue: const AsyncLoading());
    final result =
        await _restaurantService.getRestaurantDetail(id: restaurantId);
    result.when(success: (data) {
      state = state.copyWith(
        restaurantDetailValue: AsyncData(data),
        restaurantDetail: data,
      );
    }, failure: (error, stackTrace) {
      state =
          state.copyWith(restaurantDetailValue: AsyncError(error, stackTrace));
    });
  }
}

final restaurantDetailProvider =
    StateNotifierProvider<RestaurantDetailController, RestaurantDetailState>(
        (ref) {
  final restaurantService = ref.read(restaurantServiceProvider);
  return RestaurantDetailController(restaurantService);
});

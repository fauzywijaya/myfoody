import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantListController extends StateNotifier<RestaurantListState> {
  final RestaurantService _restaurantService;
  RestaurantListController(this._restaurantService)
      : super(RestaurantListState()) {
    fetchRestaurantList();
  }

  void fetchRestaurantList() async {
    state = state.copyWith(restaurantsValue: const AsyncLoading());

    final result = await _restaurantService.getRestaurantList();
    result.when(
      success: (data) {
        state = state.copyWith(
          restaurantsValue: AsyncData(data),
          restaurants: data,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          restaurantsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void fetchRestaurantCity() async {
    state = state.copyWith(cityValue: const AsyncLoading());

    final result = await _restaurantService.getRestaurantList();
    result.when(
      success: (data) {
        final cities =
            data.restaurants.map((e) => e.city).toList().toSet().toList();
        state = state.copyWith(
          cityValue: AsyncData(cities),
          city: cities,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          cityValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final restaurantListProvider =
    StateNotifierProvider<RestaurantListController, RestaurantListState>((ref) {
  final restaurantService = ref.read(restaurantServiceProvider);
  return RestaurantListController(restaurantService);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantSearchController extends StateNotifier<RestaurantSearchState> {
  final RestaurantService _restaurantServices;

  RestaurantSearchController(this._restaurantServices)
      : super(RestaurantSearchState());

  Future<void> searchRestaurant({required String query}) async {
    state = state.copyWith(searchValue: const AsyncLoading());
    final result = await _restaurantServices.getRestaurantSearch(query: query);
    result.when(
      success: (data) {
        state = state.copyWith(searchValue: AsyncData(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(searchValue: AsyncError(error, stackTrace));
      },
    );
  }

  void setQuery({required String query}) {
    state = state.copyWith(query: query);
  }

  void search(String value) {
    if (value.isNotEmpty) {
      searchRestaurant(query: value);
    }
    setQuery(query: value);
  }
}

final restaurantSearchControllerProvider =
    StateNotifierProvider<RestaurantSearchController, RestaurantSearchState>(
        (ref) {
  final restaurantService = ref.watch(restaurantServiceProvider);
  return RestaurantSearchController(restaurantService);
});

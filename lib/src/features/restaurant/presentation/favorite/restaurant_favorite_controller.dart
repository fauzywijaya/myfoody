import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/services/storage/storage_service.dart';

class RestaurantFavoriteController
    extends StateNotifier<RestaurantFavoriteState> {
  final StorageService _storageService;

  RestaurantFavoriteController(this._storageService)
      : super(const RestaurantFavoriteState());

  void getFavoriteRestaurant() async {
    state = state.copyWith(
      favoriteRestaurantsValue: const AsyncLoading(),
    );

    final result = _storageService.getAllFavorite();
    result.when(
      success: (data) {
        state = state.copyWith(
          favoriteRestaurants: data,
          favoriteRestaurantsValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          favoriteRestaurantsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final restuarantFavoriteProvider = StateNotifierProvider<
    RestaurantFavoriteController, RestaurantFavoriteState>((ref) {
  final storageService = ref.read(storageServiceProvider);
  return RestaurantFavoriteController(storageService);
});

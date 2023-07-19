import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/services/storage/storage_service.dart';

class RestaurantDetailController extends StateNotifier<RestaurantDetailState> {
  final RestaurantService _restaurantService;
  final StorageService _storageService;
  RestaurantDetailController(this._restaurantService, this._storageService)
      : super(RestaurantDetailState());

  void fetchDetailRestaurant({required String restaurantId}) async {
    state = state.copyWith(restaurantDetailValue: const AsyncLoading());
    final result =
        await _restaurantService.getRestaurantDetail(id: restaurantId);
    result.when(success: (data) {
      state = state.copyWith(
        restaurantDetailValue: AsyncData(data),
        restaurantDetail: data,
        isFavorite: _storageService.isRestaurantFavorite(data.id),
      );
    }, failure: (error, stackTrace) {
      state =
          state.copyWith(restaurantDetailValue: AsyncError(error, stackTrace));
    });
  }

  void toggleFavorite() {
    if (state.isFavorite) {
      _storageService.deleteFavoriteRestaurant(state.restaurantDetail!.id);
    } else {
      _storageService.saveFavoriteRestaurant(
          RestaurantMapper.mapToRestaurant(state.restaurantDetail!));
    }

    state = state.copyWith(
        isFavorite:
            _storageService.isRestaurantFavorite(state.restaurantDetail!.id));
  }
}

final restaurantDetailProvider =
    StateNotifierProvider<RestaurantDetailController, RestaurantDetailState>(
        (ref) {
  final restaurantService = ref.read(restaurantServiceProvider);
  final storageService = ref.read(storageServiceProvider);
  return RestaurantDetailController(restaurantService, storageService);
});

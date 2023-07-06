import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/exception/network_exceptions.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/services/services.dart';

class StorageService {
  final favoriteBox = Hive.box<String>(HiveKey.favoriteBox);

  Future<void> saveFavoriteRestaurant(RestaurantDetail restaurant) async {
    final restaurantJson = restaurant.toJson();
    return await favoriteBox.put(restaurant.id, restaurantJson);
  }

  Future deleteFavoriteRestaurant(String restaurantId) async {
    return await favoriteBox.delete(restaurantId);
  }

  bool isRestaurantFavorite(String restaurantId) {
    return favoriteBox.containsKey(restaurantId);
  }

  Result<List<RestaurantDetail>> getAllFavorite() {
    try {
      return Result.success(
        (favoriteBox.values).map<RestaurantDetail>((item) {
          return RestaurantDetail.fromJson(item);
        }).toList(),
      );
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioExceptions(error), stackTrace);
    }
  }

  Result<List<RestaurantDetail>> getAllFavoriteMovies() {
    try {
      return Result.success(
        (favoriteBox.values).map<RestaurantDetail>((item) {
          return RestaurantDetail.fromJson(item);
        }).toList(),
      );
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioExceptions(e), st);
    }
  }
}

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/exception/network_exceptions.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/services/services.dart';

class StorageService {
  final favoriteBox = Hive.box<String>(HiveKey.favoriteBox);

  Future<void> saveFavoriteRestaurant(Restaurant restaurant) async {
    final restaurantJson = restaurant.toJson();
    return await favoriteBox.put(restaurant.id, restaurantJson);
  }

  Future deleteFavoriteRestaurant(String restaurantId) async {
    return await favoriteBox.delete(restaurantId);
  }

  bool isRestaurantFavorite(String restaurantId) {
    return favoriteBox.containsKey(restaurantId);
  }

  Result<List<Restaurant>> getAllFavorite() {
    try {
      return Result.success(
        (favoriteBox.values).map<Restaurant>((item) {
          return Restaurant.fromJson(item);
        }).toList(),
      );
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioExceptions(error), stackTrace);
    }
  }

  Result<List<Restaurant>> getAllFavoriteMovies() {
    try {
      return Result.success(
        (favoriteBox.values).map<Restaurant>((item) {
          return Restaurant.fromJson(item);
        }).toList(),
      );
    } catch (e, st) {
      debugPrint(e.toString());
      return Result.failure(NetworkExceptions.getDioExceptions(e), st);
    }
  }
}

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

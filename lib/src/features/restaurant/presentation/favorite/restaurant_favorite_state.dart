// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/features/domain.dart';

class RestaurantFavoriteState {
  final List<Restaurant> favoriteRestaurants;
  final AsyncValue<List<Restaurant>> favoriteRestaurantsValue;

  const RestaurantFavoriteState({
    this.favoriteRestaurants = const [],
    this.favoriteRestaurantsValue = const AsyncLoading(),
  });

  bool get isLoading => favoriteRestaurantsValue is AsyncLoading;

  RestaurantFavoriteState copyWith({
    List<Restaurant>? favoriteRestaurants,
    AsyncValue<List<Restaurant>>? favoriteRestaurantsValue,
  }) {
    return RestaurantFavoriteState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
      favoriteRestaurantsValue:
          favoriteRestaurantsValue ?? this.favoriteRestaurantsValue,
    );
  }
}

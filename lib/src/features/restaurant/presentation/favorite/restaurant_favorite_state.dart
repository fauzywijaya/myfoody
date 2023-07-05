import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/features/domain.dart';

class RestaurantFavoriteState {
  final List<RestaurantDetail> favoriteRestaurants;
  final AsyncValue<List<RestaurantDetail>> favoriteRestaurantsValue;

  const RestaurantFavoriteState({
    this.favoriteRestaurants = const [],
    this.favoriteRestaurantsValue = const AsyncLoading(),
  });

  bool get isLoading => favoriteRestaurantsValue is AsyncLoading;

  RestaurantFavoriteState copyWith({
    List<RestaurantDetail>? favoriteRestaurants,
    AsyncValue<List<RestaurantDetail>>? favoriteRestaurantsValue,
  }) {
    return RestaurantFavoriteState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
      favoriteRestaurantsValue:
          favoriteRestaurantsValue ?? this.favoriteRestaurantsValue,
    );
  }
}

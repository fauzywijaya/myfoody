// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/features/domain.dart';

class RestaurantDetailState {
  final AsyncValue<RestaurantDetail?> restaurantDetailValue;
  final RestaurantDetail? restaurantDetail;
  final Restaurant? restaurant;
  final bool isFavorite;
  RestaurantDetailState({
    this.restaurantDetailValue = const AsyncLoading(),
    this.restaurantDetail,
    this.restaurant,
    this.isFavorite = false,
  });

  RestaurantDetailState copyWith({
    AsyncValue<RestaurantDetail?>? restaurantDetailValue,
    RestaurantDetail? restaurantDetail,
    Restaurant? restaurant,
    bool? isFavorite,
  }) {
    return RestaurantDetailState(
      restaurantDetailValue:
          restaurantDetailValue ?? this.restaurantDetailValue,
      restaurantDetail: restaurantDetail ?? this.restaurantDetail,
      restaurant: restaurant ?? this.restaurant,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

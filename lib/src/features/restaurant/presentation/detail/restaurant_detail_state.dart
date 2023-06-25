// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/features/domain.dart';

class RestaurantDetailState {
  final AsyncValue<RestaurantDetail?> restaurantDetailValue;
  final RestaurantDetail? restaurantDetail;
  RestaurantDetailState({
    this.restaurantDetailValue = const AsyncLoading(),
    this.restaurantDetail,
  });

  RestaurantDetailState copyWith({
    AsyncValue<RestaurantDetail?>? restaurantDetailValue,
    RestaurantDetail? restaurantDetail,
  }) {
    return RestaurantDetailState(
      restaurantDetailValue:
          restaurantDetailValue ?? this.restaurantDetailValue,
      restaurantDetail: restaurantDetail ?? this.restaurantDetail,
    );
  }
}

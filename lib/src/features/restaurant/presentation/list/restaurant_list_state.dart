// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/features/domain.dart';

class RestaurantListState {
  final AsyncValue<RestaurantList?> restaurantsValue;
  final RestaurantList? restaurants;
  final List<String?> city;
  final AsyncValue<List<String>?> cityValue;

  RestaurantListState({
    this.restaurantsValue = const AsyncLoading(),
    this.cityValue = const AsyncLoading(),
    this.restaurants,
    this.city = const [],
  });

  bool get isLoadingCity => cityValue.isLoading;

  RestaurantListState copyWith({
    AsyncValue<RestaurantList?>? restaurantsValue,
    RestaurantList? restaurants,
    List<String?>? city,
    AsyncValue<List<String>?>? cityValue,
  }) {
    return RestaurantListState(
      restaurantsValue: restaurantsValue ?? this.restaurantsValue,
      restaurants: restaurants ?? this.restaurants,
      city: city ?? this.city,
      cityValue: cityValue ?? this.cityValue,
    );
  }
}

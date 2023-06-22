// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/features/restaurant/domain/restaurant_search.dart';

class RestaurantSearchState {
  final AsyncValue<RestaurantSearch?> searchValue;
  final String? query;

  RestaurantSearchState({
    this.searchValue = const AsyncData(null),
    this.query = '',
  });

  RestaurantSearchState copyWith({
    AsyncValue<RestaurantSearch?>? searchValue,
    String? query,
  }) {
    return RestaurantSearchState(
      searchValue: searchValue ?? this.searchValue,
      query: query ?? this.query,
    );
  }
}

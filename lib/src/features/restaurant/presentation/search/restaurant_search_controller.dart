import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantSearchController extends StateNotifier<RestaurantSearchState> {
  final RestaurantService _restaurantServices;

  RestaurantSearchController(this._restaurantServices)
      : super(RestaurantSearchState());

  final queryTextController = TextEditingController();

  Timer? _debounce;

  void onChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        reset();
        return;
      }
      search(query);
    });
  }

  Future<void> searchRestaurant({required String query}) async {
    state = state.copyWith(searchValue: const AsyncLoading());
    final result = await _restaurantServices.getRestaurantSearch(query: query);
    result.when(
      success: (data) {
        state = state.copyWith(searchValue: AsyncData(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(searchValue: AsyncError(error, stackTrace));
      },
    );
  }

  void setQuery({required String query}) {
    state = state.copyWith(query: query);
  }

  void reset() {
    state = state.copyWith(searchValue: const AsyncData(null), query: "");
  }

  void search(String value) {
    if (value.isNotEmpty) {
      searchRestaurant(query: value);
    }
    setQuery(query: value);
  }

  @override
  void dispose() {
    queryTextController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}

final restaurantSearchControllerProvider = StateNotifierProvider.autoDispose<
    RestaurantSearchController, RestaurantSearchState>((ref) {
  final restaurantService = ref.watch(restaurantServiceProvider);
  return RestaurantSearchController(restaurantService);
});

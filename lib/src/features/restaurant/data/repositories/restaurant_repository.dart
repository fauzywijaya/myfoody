import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/exception/network_exceptions.dart';
import 'package:myfoody/src/features/data.dart';
import 'package:myfoody/src/services/services.dart';

class RestaurantRepository {
  final DioClient _dioClient;

  RestaurantRepository(this._dioClient);

  Future<Result<RestaurantListResonses>> getRestaurantList() async {
    try {
      final response = await _dioClient.get(Endpoints.restaurantList);
      return Result.success(RestaurantListResonses.fromJson(response));
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioExceptions(error), stackTrace);
    }
  }

  Future<Result<RestaurantSearchResponse>> getRestaurantSearch(
      {required String query}) async {
    try {
      final response = await _dioClient
          .get(Endpoints.restaurantSearch, queryParameters: {'q': query});
      return Result.success(RestaurantSearchResponse.fromJson(response));
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioExceptions(error), stackTrace);
    }
  }
}

final restuarantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return RestaurantRepository(dioClient);
});

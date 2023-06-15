import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/data.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/services/services.dart';

class RestaurantService {
  final RestaurantRepository _restaurantRepository;

  RestaurantService(this._restaurantRepository);

  Future<Result<RestaurantList>> getRestaurantList() async {
    final result = await _restaurantRepository.getRestaurantList();
    return result.when(
      success: (data) {
        final restaurantList = RestaurantMapper.mapToRestaurantList(data);
        return Result.success(restaurantList);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final restaurantServiceProvider = Provider<RestaurantService>((ref) {
  final restaurantRepository = ref.read(restuarantRepositoryProvider);
  return RestaurantService(restaurantRepository);
});

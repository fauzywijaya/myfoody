import 'package:myfoody/src/features/domain.dart';

class RestaurantList {
  final int count;
  final List<Restaurant> restaurants;

  RestaurantList({
    int? count,
    List<Restaurant>? restaurants,
  })  : count = count ?? 0,
        restaurants = restaurants ?? [];
}

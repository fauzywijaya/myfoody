import 'package:myfoody/src/features/data.dart';
import 'package:myfoody/src/features/domain.dart';

class RestaurantMapper {
  static RestaurantList mapToRestaurantList(RestaurantListResonses data) {
    return RestaurantList(
      count: data.count,
      restaurants: data.restaurants
          ?.map((item) => Restaurant(
                id: item.id,
                name: item.name,
                description: item.description,
                pictureId: item.pictureId,
                city: item.city,
                rating: item.rating.toString(),
              ))
          .toList(),
    );
  }

  static RestaurantSearch mapToRestaurantSearch(RestaurantSearchResponse data) {
    return RestaurantSearch(
      founded: data.founded,
      restaurants: data.restaurants
          ?.map((item) => Restaurant(
                id: item.id,
                name: item.name,
                description: item.description,
                pictureId: item.pictureId,
                city: item.city,
                rating: item.rating.toString(),
              ))
          .toList(),
    );
  }
}

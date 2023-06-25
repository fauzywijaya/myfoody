import 'package:myfoody/src/features/data.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/shared/extensions/extension.dart';

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

  static RestaurantDetail mapToRestaurantDetail(RestaurantDetailResponse data) {
    final restaurant = data.restaurant;
    return RestaurantDetail(
      id: restaurant?.id,
      city: restaurant?.city,
      description: restaurant?.description,
      name: restaurant?.name,
      pictureId: restaurant?.pictureId?.getLargePicture,
      rating: restaurant?.rating,
      address: restaurant?.address,
      categories: restaurant?.categories
          ?.map((category) => Category(name: category.name))
          .toList(),
      customerReviews: restaurant?.customerReviews
          ?.map((customerReview) => CustomerReview(
              name: customerReview.name,
              review: customerReview.review,
              date: customerReview.date))
          .toList(),
      menus: Menu(
        drinks: restaurant?.menus?.drinks
            ?.map((drink) => Drink(name: drink.name))
            .toList(),
        foods: restaurant?.menus?.foods
            ?.map((drink) => Food(name: drink.name))
            .toList(),
      ),
    );
  }
}

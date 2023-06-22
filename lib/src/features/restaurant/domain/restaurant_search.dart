// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myfoody/src/features/domain.dart';

class RestaurantSearch {
  final int founded;
  final List<Restaurant> restaurants;

  RestaurantSearch({
    int? founded,
    List<Restaurant>? restaurants,
  })  : founded = founded ?? 0,
        restaurants = restaurants ?? [];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myfoody/src/features/data.dart';

class RestaurantSearchResponse {
  bool? error;
  int? founded;
  List<RestaurantItemResponse>? restaurants;
  RestaurantSearchResponse({
    this.error,
    this.founded,
    this.restaurants,
  });

  RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantItemResponse>[];
      json['restaurants'].forEach(
        (v) {
          restaurants!.add(RestaurantItemResponse.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['founded'] = founded;
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

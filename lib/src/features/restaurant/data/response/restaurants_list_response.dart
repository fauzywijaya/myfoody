import 'package:myfoody/src/features/data.dart';

class RestaurantListResonses {
  bool? error;
  String? message;
  int? count;
  List<RestaurantItemResponse>? restaurants;

  RestaurantListResonses({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  RestaurantListResonses.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    message = json["message"];
    count = json["count"];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantItemResponse>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantItemResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}

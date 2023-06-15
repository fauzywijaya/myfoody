class RestaurantListResonses {
  bool? error;
  String? message;
  int? count;
  List<RestaurantListItemResponse>? restaurants;

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
      restaurants = <RestaurantListItemResponse>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantListItemResponse.fromJson(v));
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

class RestaurantListItemResponse {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  RestaurantListItemResponse({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  factory RestaurantListItemResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantListItemResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}

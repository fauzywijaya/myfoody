// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String rating;
  final String pictureId;
  Restaurant({
    String? id,
    String? name,
    String? description,
    String? city,
    String? rating,
    String? pictureId,
  })  : id = id ?? '',
        name = name ?? '',
        description = description ?? '',
        city = city ?? '',
        rating = rating ?? '',
        pictureId = pictureId ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'descrition': description,
      'city': city,
      'rating': rating,
      'pictureId': pictureId,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['descrition'] as String,
      city: map['city'] as String,
      rating: map['rating'] as String,
      pictureId: map['pictureId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);
}

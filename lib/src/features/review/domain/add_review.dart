// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddReview {
  final String id;
  final String name;
  final String review;

  AddReview(
    String? id,
    String? name,
    String? review,
  )   : id = id ?? '',
        name = name ?? '',
        review = review ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'review': review,
    };
  }

  factory AddReview.fromMap(Map<String, dynamic> map) {
    return AddReview(
      map['id'] as String,
      map['name'] as String,
      map['review'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddReview.fromJson(String source) =>
      AddReview.fromMap(json.decode(source) as Map<String, dynamic>);
}

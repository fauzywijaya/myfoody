// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    List<Category>? categories,
    Menu? menus,
    double? rating,
    List<CustomerReview>? customerReviews,
  })  : id = id ?? '',
        name = name ?? '',
        description = description ?? '',
        city = city ?? '',
        address = address ?? '',
        pictureId = pictureId ?? '',
        categories = categories ?? [],
        menus = menus ?? Menu(),
        rating = rating ?? 0.0,
        customerReviews = customerReviews ?? [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'address': address,
      'pictureId': pictureId,
      'categories': categories.map((x) => x.toMap()).toList(),
      'menus': menus.toMap(),
      'rating': rating,
      'customerReviews': customerReviews.map((x) => x.toMap()).toList(),
    };
  }

  factory RestaurantDetail.fromMap(Map<String, dynamic> map) {
    return RestaurantDetail(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      city: map['city'] as String,
      address: map['address'] as String,
      pictureId: map['pictureId'] as String,
      categories: List<Category>.from(
        (map['categories'] as List<int>).map<Category>(
          (x) => Category.fromMap(x as Map<String, dynamic>),
        ),
      ),
      menus: Menu.fromMap(map['menus'] as Map<String, dynamic>),
      rating: map['rating'] as double,
      customerReviews: List<CustomerReview>.from(
        (map['customerReviews'] as List<int>).map<CustomerReview>(
          (x) => CustomerReview.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantDetail.fromJson(String source) =>
      RestaurantDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Category {
  final String name;
  const Category({
    String? name,
  }) : name = name ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({
    List<Food>? foods,
    List<Drink>? drinks,
  })  : foods = foods ?? [],
        drinks = drinks ?? [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foods': foods.map((x) => x.toMap()).toList(),
      'drinks': drinks.map((x) => x.toMap()).toList(),
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      foods: List<Food>.from(
        (map['foods'] as List<int>).map<Food>(
          (x) => Food.fromMap(x as Map<String, dynamic>),
        ),
      ),
      drinks: List<Drink>.from(
        (map['drinks'] as List<int>).map<Drink>(
          (x) => Drink.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) =>
      Menu.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Food {
  final String name;

  Food({
    String? name,
  }) : name = name ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Drink {
  final String name;

  Drink({
    String? name,
  }) : name = name ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Drink.fromJson(String source) =>
      Drink.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CustomerReview {
  final String name;
  final String review;
  final String date;
  const CustomerReview({
    String? name,
    String? review,
    String? date,
  })  : name = name ?? '',
        review = review ?? '',
        date = date ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'review': review,
      'date': date,
    };
  }

  factory CustomerReview.fromMap(Map<String, dynamic> map) {
    return CustomerReview(
      name: map['name'] as String,
      review: map['review'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerReview.fromJson(String source) =>
      CustomerReview.fromMap(json.decode(source) as Map<String, dynamic>);
}

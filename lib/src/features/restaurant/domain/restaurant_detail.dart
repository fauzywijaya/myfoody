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
}

class Category {
  final String name;
  const Category({
    String? name,
  }) : name = name ?? '';
}

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({
    List<Food>? foods,
    List<Drink>? drinks,
  })  : foods = foods ?? [],
        drinks = drinks ?? [];
}

class Food {
  final String name;

  Food({
    String? name,
  }) : name = name ?? '';
}

class Drink {
  final String name;

  Drink({
    String? name,
  }) : name = name ?? '';
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
}

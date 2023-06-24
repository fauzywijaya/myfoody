import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "RestaurantDetailPage",
        style: Theme.of(context).primaryTextTheme.displayLarge,
      ),
    );
  }
}

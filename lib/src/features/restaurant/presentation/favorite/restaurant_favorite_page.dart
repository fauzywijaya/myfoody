import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';

class RestaurantFavoritePage extends StatelessWidget {
  const RestaurantFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: [
        Text(
          "Favorite",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        )
      ],
      body: const Center(
        child: Text("Favorite"),
      ),
    );
  }
}

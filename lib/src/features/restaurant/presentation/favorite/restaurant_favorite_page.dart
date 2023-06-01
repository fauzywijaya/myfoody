import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';

class RestaurantFavoritePage extends StatelessWidget {
  const RestaurantFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppSizes.h96),
        child: AppBarWidget(children: [
          Text(
            "Favorite",
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          )
        ]),
      ),
      body: const Center(
        child: Text("Favorite"),
      ),
    );
  }
}

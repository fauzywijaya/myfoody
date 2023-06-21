import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/shared/shared.dart';

class RestaurantFavoritePage extends StatelessWidget {
  const RestaurantFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller =
        InheritedDataProvider.of(context).scrollController;
    return ScaffoldWidget(
      appBar: [
        Text(
          "Favorite",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        )
      ],
      body: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            tileColor: Colors.red,
            title: Text("$index"),
          );
        },
      ),
    );
  }
}

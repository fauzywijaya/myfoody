import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/routes/routes.dart';

class RestaurantListWidget extends StatelessWidget {
  final List<Restaurant>? restaurantItems;
  const RestaurantListWidget({Key? key, required this.restaurantItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20.0,
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: restaurantItems?.length,
        itemBuilder: (context, index) {
          final item = restaurantItems?[index];
          return CustomCardWidget(
            onTap: () {
              context.goNamed(
                Routes.detail.name,
                // params: {
                //   Extras.restaurantId: item.id,
                // },
              );
            },
            imageUrl: item!.pictureId,
            name: item.name,
            description: item.description,
            location: item.city,
            rating: item.rating,
          );
        },
      ),
    );
  }
}

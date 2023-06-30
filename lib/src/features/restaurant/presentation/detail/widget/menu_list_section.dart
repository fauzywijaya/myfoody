import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/shared/shared.dart';

class MenuListDrinkSection extends StatelessWidget {
  const MenuListDrinkSection({
    super.key,
    required this.restaurant,
  });
  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Drinks",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.lightBlue, fontSize: setFontSize(24)),
        ),
        Gap.h8,
        SizedBox(
          height: AppSizes.h40,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: restaurant.menus.foods.length,
            itemBuilder: (context, index) {
              final drink = restaurant.menus.drinks[index];
              return ChipMenu(icon: Icons.water_drop_rounded, menu: drink.name);
            },
          ),
        ),
      ],
    );
  }
}

class MenuListFoodSection extends StatelessWidget {
  const MenuListFoodSection({
    super.key,
    required this.restaurant,
  });

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Foods",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.lightBlue, fontSize: setFontSize(24)),
        ),
        Gap.h8,
        SizedBox(
          height: AppSizes.h40,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: restaurant.menus.foods.length,
            itemBuilder: (context, index) {
              final food = restaurant.menus.foods[index];
              return ChipMenu(icon: Icons.food_bank_rounded, menu: food.name);
            },
          ),
        ),
      ],
    );
  }
}

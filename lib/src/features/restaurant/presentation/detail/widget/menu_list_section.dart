import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/shared.dart';

class MenuListDrinkSection extends ConsumerWidget {
  const MenuListDrinkSection({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantDetailProvider);
    final restaurant = state.restaurantDetail!;
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
          height: AppSizes.h64,
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

class MenuListFoodSection extends ConsumerWidget {
  const MenuListFoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantDetailProvider);
    final restaurant = state.restaurantDetail!;
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
          height: AppSizes.h64,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/shared.dart';

class AppBarSection extends ConsumerWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantDetailProvider);
    final controller = ref.read(restaurantDetailProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButtonWidget(),
        Text(
          state.restaurantDetail?.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(
          onPressed: () {
            controller.toggleFavorite();
            ref
                .read(restuarantFavoriteProvider.notifier)
                .getFavoriteRestaurant();
            state.isFavorite
                ? showErrorSnackbar(context,
                    "${state.restaurantDetail?.name} removed from favorite")
                : showSuccessSnackbar(context,
                    "${state.restaurantDetail?.name} added to favorite");
          },
          icon: state.isFavorite
              ? const Icon(
                  Icons.favorite_rounded,
                  color: AppColors.lightRed,
                )
              : const Icon(
                  Icons.favorite_border_rounded,
                  color: AppColors.grey,
                ),
          splashRadius: 24.0,
          splashColor:
              state.isFavorite ? AppColors.lightRed : AppColors.lightGrey,
          padding: EdgeInsets.zero,
          iconSize: 24.0,
        )
      ],
    );
  }
}

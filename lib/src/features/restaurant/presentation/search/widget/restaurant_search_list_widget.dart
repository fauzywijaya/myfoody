import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/common_widget/async_value/async_value_widget.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/routes/routes.dart';
import 'package:myfoody/src/shared/extensions/extension.dart';

class RestaurantSearchListWidget extends ConsumerWidget {
  const RestaurantSearchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantSearchControllerProvider);
    final query = state.query;
    if (query!.isEmpty) {
      return const LottieWidget(
        assets: Resource.lottieLoading,
        description: 'Search restaurant here...',
      );
    }
    return AsyncValueWidget(
      value: state.searchValue,
      data: (value) {
        if (value == null) {
          return const LottieWidget(
            assets: Resource.lottieLoading,
            description: 'Search restaurant here...',
          );
        }
        if (value.restaurants.isEmpty) {
          return LottieWidget(
            assets: Resource.lottieEmpty,
            description: '"$query" not found!',
          );
        }
        return ListView.builder(
          itemCount: value.restaurants.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = value.restaurants[index];
            return CustomCardWidget(
              onTap: () {
                context.goNamed(
                  Routes.detail.name,
                  extra: Extras(
                    datas: {
                      ExtrasKey.restaurantId: item.id,
                    },
                  ),
                );
              },
              imageUrl: item.pictureId.getMediumPicture,
              name: item.name,
              description: item.description,
              location: item.city,
              rating: item.rating,
            );
          },
        );
      },
    );
  }
}

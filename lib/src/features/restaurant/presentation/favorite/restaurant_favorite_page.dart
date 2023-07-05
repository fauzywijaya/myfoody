import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/keys/keys.dart';
import 'package:myfoody/src/constants/resource.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/routes/routes.dart';
import 'package:myfoody/src/shared/shared.dart';

class RestaurantFavoritePage extends ConsumerStatefulWidget {
  const RestaurantFavoritePage({super.key});

  @override
  ConsumerState<RestaurantFavoritePage> createState() =>
      _RestaurantFavoritePageState();
}

class _RestaurantFavoritePageState
    extends ConsumerState<RestaurantFavoritePage> {
  RestaurantFavoriteController get controller =>
      ref.read(restuarantFavoriteProvider.notifier);
  RestaurantFavoriteState get state => ref.watch(restuarantFavoriteProvider);

  @override
  void didChangeDependencies() {
    safeRebuild(() => controller.getAllFavoriteRestaurant());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController =
        InheritedDataProvider.of(context).scrollController;
    return ScaffoldWidget(
      appBar: [
        Text(
          "Favorite",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        )
      ],
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(
              child: LottieWidget(assets: Resource.lottieLoading),
            );
          } else if (state.favoriteRestaurantsValue.hasError) {
            return Center(
              child: Text(
                (state.favoriteRestaurantsValue as AsyncError).error.toString(),
              ),
            );
          } else if (state.favoriteRestaurants.isEmpty) {
            return const Center(
              child: LottieWidget(
                assets: Resource.lottieEmpty,
                description: "You dont have Favorite",
              ),
            );
          }
          return FadeInUp(
            from: 20.0,
            duration: const Duration(milliseconds: 500),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.favoriteRestaurants.length,
              itemBuilder: (context, index) {
                final item = state.favoriteRestaurants[index];
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
                  imageUrl: item.pictureId.getSmallPicture,
                  name: item.name,
                  description: item.description,
                  location: item.city,
                  rating: item.rating.toString(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

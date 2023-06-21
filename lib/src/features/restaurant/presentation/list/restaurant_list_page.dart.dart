import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/common_widget/async_value/async_value_widget.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/routes/routes.dart';
import 'package:myfoody/src/shared/shared.dart';

class RestaurantListPage extends ConsumerStatefulWidget {
  const RestaurantListPage({super.key});

  @override
  ConsumerState<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends ConsumerState<RestaurantListPage> {
  RestaurantListController get controller =>
      ref.read(restaurantListProvider.notifier);
  RestaurantListState get state => ref.watch(restaurantListProvider);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController =
        InheritedDataProvider.of(context).scrollController;
    return ScaffoldWidget(
      appBar: [
        Text(
          "MyFoody",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
        CircleAvatar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
          radius: 24,
          child: IconButton(
            splashRadius: 4.0,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.search),
            color: Theme.of(context).primaryIconTheme.color,
            onPressed: () {
              context.goNamed(Routes.search.name);
            },
          ),
        ),
      ],
      body: AsyncValueWidget(
        value: state.restaurantsValue,
        data: (context) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingWidget(),
                const CitiesListWidget(),
                RestaurantListWidget(
                    restaurantItems: state.restaurants!.restaurants)
              ],
            ),
          );
        },
      ),
    );
  }
}

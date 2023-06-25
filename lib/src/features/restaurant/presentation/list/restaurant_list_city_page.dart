import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/extensions/extension.dart';

class RestaurantListCityPage extends ConsumerStatefulWidget {
  final String city;

  const RestaurantListCityPage({super.key, required this.city});

  @override
  ConsumerState<RestaurantListCityPage> createState() =>
      _RestaurantListCityPageState();
}

class _RestaurantListCityPageState
    extends ConsumerState<RestaurantListCityPage> {
  RestaurantListController get controller =>
      ref.read(restaurantListProvider.notifier);
  RestaurantListState get state => ref.watch(restaurantListProvider);

  @override
  void didChangeDependencies() {
    safeRebuild(() => controller.festchRestaurantByCity(city: widget.city));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print("ByCity ${widget.city}");

    return ScaffoldWidget(
      appBar: [
        const BackButtonWidget(),
        Text(widget.city, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox.shrink()
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestaurantListWidget(restaurantItems: state.restaurantByCity)
          ],
        ),
      ),
    );
  }
}

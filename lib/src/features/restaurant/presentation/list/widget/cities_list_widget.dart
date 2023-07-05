import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/keys/extras_key.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/routes/routes.dart';
import 'package:myfoody/src/shared/extensions/extension.dart';

class CitiesListWidget extends ConsumerStatefulWidget {
  const CitiesListWidget({super.key});

  @override
  ConsumerState<CitiesListWidget> createState() => _CitiesListWidgetState();
}

class _CitiesListWidgetState extends ConsumerState<CitiesListWidget> {
  RestaurantListController get controller =>
      ref.read(restaurantListProvider.notifier);
  RestaurantListState get state => ref.watch(restaurantListProvider);

  @override
  void didChangeDependencies() {
    safeRebuild(() => controller.fetchRestaurantCity());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20.0,
      duration: const Duration(milliseconds: 500),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: state.city
              .asMap()
              .map(
                (index, value) => MapEntry(
                  index,
                  ChipWidget(
                    name: value!,
                    isFirst: index == 0,
                    onTap: () {
                      context.pushNamed(
                        Routes.city.name,
                        extra: Extras(
                          datas: {
                            ExtrasKey.city: value,
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}

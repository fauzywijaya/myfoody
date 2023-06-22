import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/common_widget/async_value/async_value_widget.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantSearchPage extends ConsumerStatefulWidget {
  const RestaurantSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends ConsumerState<RestaurantSearchPage> {
  TextEditingController get controller => TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 24.0,
            child: IconButton(
              splashRadius: 4.0,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back),
              color: Theme.of(context).primaryIconTheme.color,
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
        Gap.w16,
        Expanded(
          flex: 6,
          child: SearchField(controller: controller),
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResultTextWidget(),
            Gap.h28,
            const RestaurantSearchListWidget(),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InputFormWidget.search(
          controller: controller,
          hintText: 'Kafe Kamara',
          prefixIcon: Icons.search_rounded,
          suffixIcon: Icons.close_rounded,
          onChanged: (value) {
            if (value.isNotEmpty) {
              ref
                  .read(restaurantSearchControllerProvider.notifier)
                  .searchRestaurant(query: value);
            }
            ref
                .read(restaurantSearchControllerProvider.notifier)
                .setQuery(query: value);
          },
        );
      },
    );
  }
}

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final result = ref.watch(restaurantSearchControllerProvider);
        final query = result.query;
        if (query!.isNotEmpty) {
          return Text(
            'Results for "$query"',
            style: Theme.of(context).textTheme.titleMedium,
          );
        }
        return Container();
      },
    );
  }
}

class RestaurantSearchListWidget extends ConsumerWidget {
  const RestaurantSearchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantSearchControllerProvider);
    final controller = ref.read(restaurantSearchControllerProvider.notifier);
    final query = state.query;
    if (query!.isEmpty) {
      return const LoadingChipHorizontal();
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
              onTap: () {},
              imageUrl: item.pictureId,
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

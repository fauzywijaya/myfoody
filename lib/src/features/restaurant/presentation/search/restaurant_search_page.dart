import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';

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
              onPressed: () {},
            ),
          ),
        ),
        Gap.w16,
        Expanded(
          flex: 6,
          child: InputFormWidget(
            controller: controller,
            hintText: 'Kafe Kamara',
            prefixIcon: Icons.search_rounded,
            suffixIcon: Icons.close_rounded,
          ),
        )
      ],
      body: const Center(
        child: Text("Tect Search"),
      ),
    );
  }
}

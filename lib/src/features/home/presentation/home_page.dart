import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        items: _buildItemNavBar(context),
        iconSize: 24,
        selectedColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
        unSelectedColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        borderRadius: Radius.circular(20.r),
        isFloating: true,
        currentIndex: state.currentIndex!,
        onTap: (index) {
          controller.onChangeScreen(index);
        },
      ),
      body: _buildScreen[state.currentIndex!],
    );
  }

  final List<Widget> _buildScreen = [
    const RestaurantListPage(),
    const RestaurantFavoritePage(),
    const SettingPage(),
  ];

  List<CustomNavigationBarItem> _buildItemNavBar(BuildContext context) {
    return [
      CustomNavigationBarItem(
        icon: const Icon(Icons.local_restaurant_rounded),
        title: Text(
          "Restaurant",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      CustomNavigationBarItem(
        icon: const Icon(Icons.favorite_rounded),
        title: Text(
          "Favorite",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      CustomNavigationBarItem(
        icon: const Icon(Icons.settings_rounded),
        title: Text(
          "Setting",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    ];
  }
}

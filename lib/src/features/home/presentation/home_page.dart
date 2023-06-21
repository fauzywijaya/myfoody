import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/bottom_navigation/bottom_appbar_widget.dart';
import 'package:myfoody/src/features/presentation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);
  late TabController tabController;
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != state.currentIndex && mounted) {
          controller.onChangeScreen(value);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomAppBarWidget(
          currentPage: state.currentIndex!,
          tabController: tabController,
          colors: colors,
          selectedColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
          unselectedColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          start: 10,
          end: 2,
          child: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: _buildScreen,
          ),
        ),
      ),
    );
  }

  final List<Widget> _buildScreen = [
    const RestaurantListPage(),
    const RestaurantFavoritePage(),
    const SettingPage(),
  ];

  // List<BottomNavigationBarItem> _buildItemNavBar(BuildContext context) {
  //   return [
  //     const BottomNavigationBarItem(
  //       icon: Icon(Icons.local_restaurant_rounded),
  //       label: "Restaurant",
  //     ),
  //     const BottomNavigationBarItem(
  //       icon: Icon(Icons.favorite_rounded),
  //       label: "Favorite",
  //     ),
  //     const BottomNavigationBarItem(
  //       icon: Icon(Icons.settings_rounded),
  //       label: "Setting",
  //     ),
  //   ];
  // }
}

import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  final List<String> chipData = [
    'Chip 1',
    'Chip 2',
    'Chip 3',
    'Chip 4',
    'Chip 5',
  ];

  final List<String> listTileData = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        size: AppSizes.h96,
        children: [
          Text(
            "MyFoody",
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
          CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.6),
            radius: 24,
            child: IconButton(
              splashRadius: 4.0,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.search),
              color: Theme.of(context).primaryIconTheme.color,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: ListView(
          children: [
            const GreetingWidget(),
            CitiesListWidget(),
            const RestaurantListWidget(),
          ],
        ),
      ),
    );
  }

  bool _scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController?.animateTo(scrollNotification.metrics.pixels / 350);
      return true;
    }
    return false;
  }
}

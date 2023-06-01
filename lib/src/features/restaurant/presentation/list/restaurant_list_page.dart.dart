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
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = ColorTween(
            begin: Theme.of(context).scaffoldBackgroundColor,
            end: Theme.of(context).appBarTheme.backgroundColor)
        .animate(_animationController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppSizes.h96),
        child: AppBarWidget(children: [
          Text("MyFoody",
              style: Theme.of(context).appBarTheme.toolbarTextStyle),
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
        ]),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: ListView(
          children: const [GreetingWidget()],
        ),
      ),
    );
  }

  bool _scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 350);
      return true;
    }
    return false;
  }
}

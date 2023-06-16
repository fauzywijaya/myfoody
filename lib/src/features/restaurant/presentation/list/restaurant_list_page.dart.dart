import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
        ),
      ],
      body: ListView(
        children: [
          const GreetingWidget(),
          CitiesListWidget(),
          const RestaurantListWidget(),
        ],
      ),
    );

    // return Scaffold(
    //   // appBar: PreferredSize(
    //   //   preferredSize: Size.fromHeight(setHeight(96)),
    //   //   child: AnimatedBuilder(
    //   //       animation: _animationController,
    //   //       builder: (context, child) {
    //   //         return AppBar(
    //   //           elevation: 0.0,
    //   //           titleSpacing: 24.0,
    //   //           centerTitle: false,
    //   //           automaticallyImplyLeading: false,
    //   //           toolbarHeight: AppSizes.h96,
    //   //           backgroundColor: _backgroundColorTween.value,
    //   //           systemOverlayStyle: SystemUiOverlayStyle(
    //   //             statusBarBrightness: Theme.of(context).brightness,
    //   //           ),
    //   //           title: Row(
    //   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //             children:
    //   //           ),
    //   //         );
    //   //       }),
    //   // ),
    //   appBar: AppBarWidget(
    //     size: AppSizes.h96,
    //     children: [
    //       Text(
    //         "MyFoody",
    //         style: Theme.of(context).appBarTheme.toolbarTextStyle,
    //       ),
    //       CircleAvatar(
    //         backgroundColor:
    //             Theme.of(context).colorScheme.primary.withOpacity(0.6),
    //         radius: 24,
    //         child: IconButton(
    //           splashRadius: 4.0,
    //           padding: EdgeInsets.zero,
    //           icon: const Icon(Icons.search),
    //           color: Theme.of(context).primaryIconTheme.color,
    //           onPressed: () {},
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: NotificationListener<ScrollNotification>(
    //     onNotification: _scrollListener,
    //     child:
    //   ),
    // );
  }
}

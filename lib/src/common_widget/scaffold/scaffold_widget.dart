// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/shared.dart';

class ScaffoldWidget extends StatefulWidget {
  final Widget appBar;
  final Widget body;

  const ScaffoldWidget({Key? key, required this.appBar, required this.body})
      : super(key: key);

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _backgroundColorTween;
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
    _animationController.dispose();
    super.dispose();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollInfo.metrics.pixels / 350);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    _backgroundColorTween = ColorTween(
      begin: Theme.of(context).scaffoldBackgroundColor,
      end: Theme.of(context).appBarTheme.backgroundColor,
    ).animate(_animationController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(setHeight(96)),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return AppBar(
              elevation: 0.0,
              titleSpacing: 24.0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              toolbarHeight: AppSizes.h96,
              backgroundColor: _backgroundColorTween.value,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Theme.of(context).brightness,
              ),
              title: widget.appBar,
            );
          },
        ),
      ),
      body: NotificationListener<ScrollNotification>(
          onNotification: _scrollListener, child: widget.body),
    );
  }
}

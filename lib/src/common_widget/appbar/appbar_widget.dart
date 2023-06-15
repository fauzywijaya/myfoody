// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myfoody/src/constants/constants.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> children;
  final double size;

  const AppBarWidget({Key? key, required this.children, required this.size})
      : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(size);
}

class _AppBarWidgetState extends State<AppBarWidget>
    with TickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _colorTween = ColorTween(
      begin: Theme.of(context).scaffoldBackgroundColor,
      end: Theme.of(context).appBarTheme.backgroundColor,
    ).animate(_colorAnimationController);
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: AnimatedBuilder(
        animation: _colorAnimationController,
        builder: (context, child) {
          return AppBar(
            elevation: 0.0,
            titleSpacing: 24.0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            toolbarHeight: AppSizes.h96,
            backgroundColor: _colorTween.value,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Theme.of(context).brightness,
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.children),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfoody/src/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  final List<Widget> children;

  const AppBarWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 24.0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      toolbarHeight: AppSizes.h96,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Theme.of(context).brightness,
      ),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }
}

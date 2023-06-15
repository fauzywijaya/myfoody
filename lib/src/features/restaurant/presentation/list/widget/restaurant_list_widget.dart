import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20.0,
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CustomCardWidget();
        },
      ),
    );
  }
}

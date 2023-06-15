import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';

class CitiesListWidget extends StatelessWidget {
  final List<String> chipData = [
    'Chip 1',
    'Chip 2',
    'Chip 3',
    'Chip 4',
    'Chip 5',
  ];

  CitiesListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20.0,
      duration: const Duration(milliseconds: 500),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: chipData
              .asMap()
              .map((index, value) => MapEntry(index,
                  ChipWidget(name: value, isFirst: index == 0, onClick: () {})))
              .values
              .toList(),
        ),
      ),
    );
  }
}

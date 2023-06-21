import 'package:flutter/material.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/utils/utils.dart';

class LoadingChipHorizontal extends StatelessWidget {
  final int length;
  const LoadingChipHorizontal({
    Key? key,
    this.length = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            length,
            (i) => Container(
              width: setWidth(150),
              height: setHeight(40),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

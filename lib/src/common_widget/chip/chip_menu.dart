import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/shared.dart';

class ChipMenu extends StatelessWidget {
  const ChipMenu({
    Key? key,
    required this.menu,
    required this.icon,
  }) : super(key: key);

  final String menu;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: AppSizes.w20,
      // ),
      margin: EdgeInsets.only(
        right: 20.w,
        // top: 20.h,
        // bottom: 20.h,
        // left: 20.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: setWidth(10),
            vertical: setHeight(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.secondary,
                size: 24.0,
              ),
              Gap.w8,
              Text(
                menu,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

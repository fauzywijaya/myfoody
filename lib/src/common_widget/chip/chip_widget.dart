import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/shared.dart';

class ChipWidget extends StatelessWidget {
  final String name;
  final bool isFirst;
  final double leftMargin;
  final VoidCallback onClick;
  const ChipWidget({
    Key? key,
    required this.name,
    required this.isFirst,
    this.leftMargin = 22,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.w,
        top: 20.h,
        bottom: 20.h,
        left: isFirst ? setWidth(leftMargin) : 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Material(
        type: MaterialType.transparency,
        color: Colors.amber,
        child: InkWell(
          onTap: () => onClick(),
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: setWidth(25),
              vertical: setHeight(10),
            ),
            child: Text(name, style: Theme.of(context).textTheme.titleMedium),
          ),
        ),
      ),
    );
  }
}

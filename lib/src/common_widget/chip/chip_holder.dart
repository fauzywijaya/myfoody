import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/shared/extensions/extension.dart';

class BottomSheetHolder extends StatelessWidget {
  const BottomSheetHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).cardColor,
        ),
        height: AppSizes.h10,
        width: context.screenWidth * 0.2,
      ),
    );
  }
}

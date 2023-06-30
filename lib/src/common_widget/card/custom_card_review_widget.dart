// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myfoody/src/constants/constants.dart';

class CardReviewWidget extends StatelessWidget {
  const CardReviewWidget({
    Key? key,
    required this.review,
    required this.name,
    required this.date,
  }) : super(key: key);

  final String review;
  final String name;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.h16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"$review"',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Gap.h8,
          Text(
            '- $name, $date',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

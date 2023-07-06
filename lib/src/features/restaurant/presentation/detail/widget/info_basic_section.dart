// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:readmore/readmore.dart';

import 'package:myfoody/src/common_widget/chip/chip_widget.dart';
import 'package:myfoody/src/constants/constants.dart';

class InfoBasicSection extends ConsumerWidget {
  const InfoBasicSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantDetailProvider);
    final details = state.restaurantDetail;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: details!.categories
              .asMap()
              .map(
                (index, value) => MapEntry(
                  index,
                  ChipWidget(
                    name: value.name,
                    isFirst: false,
                    onTap: () {},
                  ),
                ),
              )
              .values
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(details.name,
                style: Theme.of(context).primaryTextTheme.headlineMedium),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                    size: 22.0,
                  ),
                ),
                Gap.w16,
                Text(details.rating.toString(),
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
        Gap.h8,
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(
                Icons.location_on_rounded,
                color: AppColors.white,
                size: 22.0,
              ),
            ),
            Gap.w16,
            Text(
              "${details.city}, ${details.address}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Gap.h8,
        ReadMoreText(
          details.description,
          trimLines: 5,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Tampilkan lebih banyak',
          trimExpandedText: 'Tampilkan lebih sedikit',
          textAlign: TextAlign.justify,
          colorClickableText:
              Theme.of(context).primaryTextTheme.bodyLarge!.color,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(letterSpacing: 0.2),
          moreStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

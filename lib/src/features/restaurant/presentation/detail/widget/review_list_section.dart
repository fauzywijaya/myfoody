// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';

import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/shared.dart';

class ReviewListSection extends StatelessWidget {
  const ReviewListSection({
    Key? key,
    required this.restaurantDetail,
  }) : super(key: key);

  final RestaurantDetail restaurantDetail;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reviews',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.lightBlue),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See All',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.lightBlue),
              ),
            ),
          ],
        ),
        Gap.h8,
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 0),
          itemCount: restaurantDetail.customerReviews.length < 3
              ? restaurantDetail.customerReviews.length
              : 3,
          itemBuilder: (context, index) {
            final customerReview = restaurantDetail.customerReviews[index];
            return Padding(
              padding: EdgeInsets.only(bottom: AppSizes.h10),
              child: CardReviewWidget(
                  name: customerReview.name,
                  date: customerReview.date,
                  review: customerReview.review),
            );
          },
        ),
        Gap.h8,
        ButtonWidget.primary(
          text: 'Add Review',
          isEnabled: true,
          onTap: () {
            showRegularBottomSheet(context, child: const AddReviewPage());
          },
        ),
      ],
    );
  }
}

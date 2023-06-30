// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/shared.dart';

class RestaurantDetailPage extends ConsumerStatefulWidget {
  final String restaurantId;

  const RestaurantDetailPage({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  ConsumerState<RestaurantDetailPage> createState() =>
      _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<RestaurantDetailPage> {
  RestaurantDetailController get controller =>
      ref.read(restaurantDetailProvider.notifier);

  RestaurantDetailState get state => ref.watch(restaurantDetailProvider);

  @override
  void didChangeDependencies() {
    safeRebuild(() =>
        controller.fetchDetailRestaurant(restaurantId: widget.restaurantId));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: [
        const BackButtonWidget(),
        Text(
          state.restaurantDetail?.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_rounded),
          splashRadius: 24.0,
          splashColor: Colors.grey[200],
          padding: EdgeInsets.zero,
          iconSize: 24.0,
        )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageDetailSection(
                imageUrl: state.restaurantDetail!.pictureId,
              ),
              Gap.h8,
              InfoBasicSection(
                restaurantDetail: state.restaurantDetail!,
              ),
              Gap.h8,
              MenuListFoodSection(restaurant: state.restaurantDetail!),
              Gap.h8,
              MenuListDrinkSection(restaurant: state.restaurantDetail!),
              Gap.h8,
              ReviewListSection(restaurantDetail: state.restaurantDetail!),
              Gap.h8,
            ],
          ),
        ),
      ),
    );
  }
}

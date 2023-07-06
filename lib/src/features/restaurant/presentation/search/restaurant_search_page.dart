import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/presentation.dart';

class RestaurantSearchPage extends ConsumerStatefulWidget {
  const RestaurantSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends ConsumerState<RestaurantSearchPage> {
  TextEditingController get controller => TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: [
        const Expanded(
          flex: 1,
          child: BackButtonWidget(),
        ),
        Gap.w16,
        Expanded(
          flex: 6,
          child: SearchField(controller: controller),
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResultTextWidget(),
            Gap.h28,
            const RestaurantSearchListWidget(),
          ],
        ),
      ),
    );
  }
}

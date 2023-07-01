// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/exception/network_exceptions.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/shared.dart';

class AddReviewPage extends ConsumerWidget {
  final String restaurantId;

  const AddReviewPage({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addReviewControllerProvider);
    final controller = ref.read(addReviewControllerProvider.notifier);
    ref.listen(addReviewControllerProvider, (previous, next) {
      next.reviewValue.maybeWhen(
          data: (data) {
            if (data != null) {
              ref
                  .read(restaurantDetailProvider.notifier)
                  .fetchDetailRestaurant(restaurantId: restaurantId);
              Navigator.of(context).pop();
              showSuccessSnackbar(context, "Success add Review");
            }
          },
          orElse: () {});
    });
    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppColors.darkGrey,
          child: SafeArea(
            top: false,
            child: Form(
              onChanged: controller.isValidForm,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BottomSheetHolder(),
                  Gap.h20,
                  Text(
                    'Add Notes',
                    style: Theme.of(context).primaryTextTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                  Gap.h20,
                  InputFormWidget(
                    controller: controller.nameController,
                    hintText: "Input your Name here...",
                    validator: controller.validName,
                  ),
                  Gap.h20,
                  InputFormWidget(
                    controller: controller.reviewController,
                    hintText: "Input your Review here...",
                    maxLines: 4,
                    validator: controller.validReview,
                  ),
                  Gap.h40,
                  ButtonWidget.primary(
                    text: "SUBMIT",
                    onTap: () {
                      controller.postReview(restaurantId: restaurantId);
                    },
                    isLoading: state.isLoading,
                    isEnabled: state.isValidReview,
                  ),
                  Gap.h20,
                  state.reviewValue.maybeWhen(
                      error: (error, stackTrace) {
                        return Text(
                          'Failed to Review : ${NetworkExceptions.getErrorMessage(error as NetworkExceptions)}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.red),
                        );
                      },
                      orElse: () => const SizedBox.shrink())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

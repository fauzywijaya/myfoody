import 'package:flutter/material.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppColors.darkGrey,
          child: SafeArea(
            top: false,
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
                const InputFormWidget(
                  // controller: controller.titleController,
                  hintText: "Input your Name here...",
                  // validator: controller.validateTitleText,
                ),
                Gap.h20,
                const InputFormWidget(
                  // controller: controller.descController,
                  hintText: "Input your Description here...",
                  maxLines: 4,
                  // validator: controller.validateTitleText,
                ),
                Gap.h40,
                const ButtonWidget.primary(
                  text: "SUBMIT",
                  // onTap: controller.postNotes,
                  // isLoading: state.isLoading,
                  // isEnabled: state.isAddValid,
                ),
                Gap.h20,
                // state.postNoteValue.maybeWhen(
                //     error: (error, stackTrace) {
                //       return Text(
                //         'Failed to Add Note: ${NetworkExceptions.getErrorMessage(error as NetworkExceptions)}',
                //         style: TypographyApp.text1.red,
                //       );
                //     },
                //     orElse: () => const SizedBox.shrink())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

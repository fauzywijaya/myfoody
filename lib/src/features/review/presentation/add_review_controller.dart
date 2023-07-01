import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/shared/extensions/dynamic.dart';

class AddReviewController extends StateNotifier<AddReviewState> {
  final ReviewService _reviewService;
  AddReviewController(this._reviewService) : super(AddReviewState());

  final nameController = TextEditingController();
  final reviewController = TextEditingController();

  Future<void> postReview({required String restaurantId}) async {
    state = state.copyWith(reviewValue: const AsyncLoading());
    final addReview =
        AddReview(restaurantId, nameController.text, reviewController.text);
    final result = await _reviewService.postReview(addReview);
    result.when(success: (data) {
      state = state.copyWith(reviewValue: AsyncData(data));
    }, failure: (error, stackTrace) {
      state = state.copyWith(reviewValue: AsyncError(error, stackTrace));
    });
  }

  void isValidForm() {
    state = state.copyWith(
        isValidReview: validName(nameController.text).isNull() &&
            validReview(reviewController.text).isNull());
  }

  String? validName(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  String? validReview(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }
}

final addReviewControllerProvider =
    StateNotifierProvider.autoDispose<AddReviewController, AddReviewState>(
        (ref) {
  final reviewService = ref.read(reviewServicerProvider);
  return AddReviewController(reviewService);
});

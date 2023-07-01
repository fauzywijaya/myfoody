// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddReviewState {
  final AsyncValue<String?> reviewValue;
  final bool isValidReview;
  AddReviewState({
    this.reviewValue = const AsyncData(null),
    this.isValidReview = false,
  });

  bool get isLoading => reviewValue is AsyncLoading;

  AddReviewState copyWith({
    AsyncValue<String?>? reviewValue,
    bool? isValidReview,
  }) {
    return AddReviewState(
      reviewValue: reviewValue ?? this.reviewValue,
      isValidReview: isValidReview ?? this.isValidReview,
    );
  }
}

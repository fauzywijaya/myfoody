import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/data.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/services/services.dart';

class ReviewService {
  final ReviewRepository _reviewRepository;

  ReviewService(this._reviewRepository);

  Future<Result<String?>> postReview(AddReview addReview) async {
    final result = await _reviewRepository.postReview(addReview);
    return result.when(success: (data) {
      return const Result.success("Success");
    }, failure: (error, stackTrace) {
      return Result.failure(error, stackTrace);
    });
  }
}

final reviewServicerProvider = Provider<ReviewService>((ref) {
  final reviewRepository = ref.read(reviewRepositoryProvider);
  return ReviewService(reviewRepository);
});

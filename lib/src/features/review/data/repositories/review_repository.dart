import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/exception/network_exceptions.dart';
import 'package:myfoody/src/features/review/domain/add_review.dart';
import 'package:myfoody/src/services/services.dart';

class ReviewRepository {
  final DioClient _dioClient;

  ReviewRepository(this._dioClient);

  Future<Result<void>> postReview(AddReview addReview) async {
    try {
      await _dioClient.post(Endpoints.review, data: addReview.toJson());
      return const Result.success(null);
    } catch (error, stackTrace) {
      return Result.failure(
          NetworkExceptions.getDioExceptions(error), stackTrace);
    }
  }
}

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return ReviewRepository(dioClient);
});

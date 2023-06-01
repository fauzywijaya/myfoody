import 'package:myfoody/src/exception/network_exceptions.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'results.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  /// [INFO]
  /// This function is returning when it success, usually call it inside try
  /// of try...catch, so it will be safe to get data from this function.
  const factory Result.success(T data) = Success<T>;

  /// [INFO]
  /// This function is returning when it failure, usually call it inside catch
  /// of try...catch, so it will be more helpful to get error from try catch
  const factory Result.failure(NetworkExceptions error, StackTrace stackTrace) =
      Failure<T>;
}

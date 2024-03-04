import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote_repository/src/models/common/network_exception.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required NetworkException error}) =
      Failure<T>;
}

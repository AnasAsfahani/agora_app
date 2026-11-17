import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../errors/error_model.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T? data) = Success<T>;
  const factory ApiResult.failure(ErrorModel errorModel) = Failure<T>;
}

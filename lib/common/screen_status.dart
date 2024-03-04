import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_status.freezed.dart';

/// Simplified loading status class for
@freezed
class ScreenStatus with _$ScreenStatus {
  const factory ScreenStatus.pure() = ScreenStatusPure;
  const factory ScreenStatus.loading() = ScreenStatusLoading;
  const factory ScreenStatus.success({String? messageKey}) =
      ScreenStatusSuccess;
  const factory ScreenStatus.error({String? messageKey}) = ScreenStatusError;
}

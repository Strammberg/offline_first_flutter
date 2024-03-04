import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offline_first/common/screen_status.dart';
import 'package:remote_repository/remote_repository.dart';

part 'dummy_state.freezed.dart';

@freezed
class DummyState with _$DummyState {
  factory DummyState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default([]) List<DummyModel> dummies,
  }) = _DummyState;
}
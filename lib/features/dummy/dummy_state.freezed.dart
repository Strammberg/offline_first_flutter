// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DummyState {
  ScreenStatus get status => throw _privateConstructorUsedError;
  List<DummyModel> get dummies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DummyStateCopyWith<DummyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyStateCopyWith<$Res> {
  factory $DummyStateCopyWith(
          DummyState value, $Res Function(DummyState) then) =
      _$DummyStateCopyWithImpl<$Res, DummyState>;
  @useResult
  $Res call({ScreenStatus status, List<DummyModel> dummies});

  $ScreenStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$DummyStateCopyWithImpl<$Res, $Val extends DummyState>
    implements $DummyStateCopyWith<$Res> {
  _$DummyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dummies = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      dummies: null == dummies
          ? _value.dummies
          : dummies // ignore: cast_nullable_to_non_nullable
              as List<DummyModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get status {
    return $ScreenStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DummyStateImplCopyWith<$Res>
    implements $DummyStateCopyWith<$Res> {
  factory _$$DummyStateImplCopyWith(
          _$DummyStateImpl value, $Res Function(_$DummyStateImpl) then) =
      __$$DummyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScreenStatus status, List<DummyModel> dummies});

  @override
  $ScreenStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$DummyStateImplCopyWithImpl<$Res>
    extends _$DummyStateCopyWithImpl<$Res, _$DummyStateImpl>
    implements _$$DummyStateImplCopyWith<$Res> {
  __$$DummyStateImplCopyWithImpl(
      _$DummyStateImpl _value, $Res Function(_$DummyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dummies = null,
  }) {
    return _then(_$DummyStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
      dummies: null == dummies
          ? _value._dummies
          : dummies // ignore: cast_nullable_to_non_nullable
              as List<DummyModel>,
    ));
  }
}

/// @nodoc

class _$DummyStateImpl implements _DummyState {
  _$DummyStateImpl(
      {this.status = const ScreenStatus.pure(),
      final List<DummyModel> dummies = const []})
      : _dummies = dummies;

  @override
  @JsonKey()
  final ScreenStatus status;
  final List<DummyModel> _dummies;
  @override
  @JsonKey()
  List<DummyModel> get dummies {
    if (_dummies is EqualUnmodifiableListView) return _dummies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dummies);
  }

  @override
  String toString() {
    return 'DummyState(status: $status, dummies: $dummies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DummyStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._dummies, _dummies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_dummies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DummyStateImplCopyWith<_$DummyStateImpl> get copyWith =>
      __$$DummyStateImplCopyWithImpl<_$DummyStateImpl>(this, _$identity);
}

abstract class _DummyState implements DummyState {
  factory _DummyState(
      {final ScreenStatus status,
      final List<DummyModel> dummies}) = _$DummyStateImpl;

  @override
  ScreenStatus get status;
  @override
  List<DummyModel> get dummies;
  @override
  @JsonKey(ignore: true)
  _$$DummyStateImplCopyWith<_$DummyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

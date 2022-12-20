// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  SnackBarMessage? get snackBarMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonScreenStateCopyWith<CommonScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonScreenStateCopyWith<$Res> {
  factory $CommonScreenStateCopyWith(
          CommonScreenState value, $Res Function(CommonScreenState) then) =
      _$CommonScreenStateCopyWithImpl<$Res, CommonScreenState>;
  @useResult
  $Res call({bool isLoading, SnackBarMessage? snackBarMessage});
}

/// @nodoc
class _$CommonScreenStateCopyWithImpl<$Res, $Val extends CommonScreenState>
    implements $CommonScreenStateCopyWith<$Res> {
  _$CommonScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? snackBarMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      snackBarMessage: freezed == snackBarMessage
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as SnackBarMessage?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonScreenStateCopyWith<$Res>
    implements $CommonScreenStateCopyWith<$Res> {
  factory _$$_CommonScreenStateCopyWith(_$_CommonScreenState value,
          $Res Function(_$_CommonScreenState) then) =
      __$$_CommonScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, SnackBarMessage? snackBarMessage});
}

/// @nodoc
class __$$_CommonScreenStateCopyWithImpl<$Res>
    extends _$CommonScreenStateCopyWithImpl<$Res, _$_CommonScreenState>
    implements _$$_CommonScreenStateCopyWith<$Res> {
  __$$_CommonScreenStateCopyWithImpl(
      _$_CommonScreenState _value, $Res Function(_$_CommonScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? snackBarMessage = freezed,
  }) {
    return _then(_$_CommonScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      snackBarMessage: freezed == snackBarMessage
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as SnackBarMessage?,
    ));
  }
}

/// @nodoc

class _$_CommonScreenState implements _CommonScreenState {
  const _$_CommonScreenState({this.isLoading = false, this.snackBarMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final SnackBarMessage? snackBarMessage;

  @override
  String toString() {
    return 'CommonScreenState(isLoading: $isLoading, snackBarMessage: $snackBarMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.snackBarMessage, snackBarMessage) ||
                other.snackBarMessage == snackBarMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, snackBarMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonScreenStateCopyWith<_$_CommonScreenState> get copyWith =>
      __$$_CommonScreenStateCopyWithImpl<_$_CommonScreenState>(
          this, _$identity);
}

abstract class _CommonScreenState implements CommonScreenState {
  const factory _CommonScreenState(
      {final bool isLoading,
      final SnackBarMessage? snackBarMessage}) = _$_CommonScreenState;

  @override
  bool get isLoading;
  @override
  SnackBarMessage? get snackBarMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CommonScreenStateCopyWith<_$_CommonScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

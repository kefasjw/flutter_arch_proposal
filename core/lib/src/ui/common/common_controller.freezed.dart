// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonScreenUiState {
  bool get isLoading => throw _privateConstructorUsedError;
  SnackBarMessage? get snackBarMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonScreenUiStateCopyWith<CommonScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonScreenUiStateCopyWith<$Res> {
  factory $CommonScreenUiStateCopyWith(
          CommonScreenUiState value, $Res Function(CommonScreenUiState) then) =
      _$CommonScreenUiStateCopyWithImpl<$Res, CommonScreenUiState>;
  @useResult
  $Res call({bool isLoading, SnackBarMessage? snackBarMessage});
}

/// @nodoc
class _$CommonScreenUiStateCopyWithImpl<$Res, $Val extends CommonScreenUiState>
    implements $CommonScreenUiStateCopyWith<$Res> {
  _$CommonScreenUiStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_CommonScreenUiStateCopyWith<$Res>
    implements $CommonScreenUiStateCopyWith<$Res> {
  factory _$$_CommonScreenUiStateCopyWith(_$_CommonScreenUiState value,
          $Res Function(_$_CommonScreenUiState) then) =
      __$$_CommonScreenUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, SnackBarMessage? snackBarMessage});
}

/// @nodoc
class __$$_CommonScreenUiStateCopyWithImpl<$Res>
    extends _$CommonScreenUiStateCopyWithImpl<$Res, _$_CommonScreenUiState>
    implements _$$_CommonScreenUiStateCopyWith<$Res> {
  __$$_CommonScreenUiStateCopyWithImpl(_$_CommonScreenUiState _value,
      $Res Function(_$_CommonScreenUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? snackBarMessage = freezed,
  }) {
    return _then(_$_CommonScreenUiState(
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

class _$_CommonScreenUiState implements _CommonScreenUiState {
  const _$_CommonScreenUiState({this.isLoading = false, this.snackBarMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final SnackBarMessage? snackBarMessage;

  @override
  String toString() {
    return 'CommonScreenUiState(isLoading: $isLoading, snackBarMessage: $snackBarMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonScreenUiState &&
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
  _$$_CommonScreenUiStateCopyWith<_$_CommonScreenUiState> get copyWith =>
      __$$_CommonScreenUiStateCopyWithImpl<_$_CommonScreenUiState>(
          this, _$identity);
}

abstract class _CommonScreenUiState implements CommonScreenUiState {
  const factory _CommonScreenUiState(
      {final bool isLoading,
      final SnackBarMessage? snackBarMessage}) = _$_CommonScreenUiState;

  @override
  bool get isLoading;
  @override
  SnackBarMessage? get snackBarMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CommonScreenUiStateCopyWith<_$_CommonScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

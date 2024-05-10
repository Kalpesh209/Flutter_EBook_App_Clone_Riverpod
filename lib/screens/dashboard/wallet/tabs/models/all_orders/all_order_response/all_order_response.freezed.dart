// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllOrderResponse _$AllOrderResponseFromJson(Map<String, dynamic> json) {
  return _AllOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$AllOrderResponse {
  Data? get data => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllOrderResponseCopyWith<AllOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllOrderResponseCopyWith<$Res> {
  factory $AllOrderResponseCopyWith(
          AllOrderResponse value, $Res Function(AllOrderResponse) then) =
      _$AllOrderResponseCopyWithImpl<$Res, AllOrderResponse>;
  @useResult
  $Res call({Data? data, bool? success, String? message});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$AllOrderResponseCopyWithImpl<$Res, $Val extends AllOrderResponse>
    implements $AllOrderResponseCopyWith<$Res> {
  _$AllOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllOrderResponseImplCopyWith<$Res>
    implements $AllOrderResponseCopyWith<$Res> {
  factory _$$AllOrderResponseImplCopyWith(_$AllOrderResponseImpl value,
          $Res Function(_$AllOrderResponseImpl) then) =
      __$$AllOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data? data, bool? success, String? message});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AllOrderResponseImplCopyWithImpl<$Res>
    extends _$AllOrderResponseCopyWithImpl<$Res, _$AllOrderResponseImpl>
    implements _$$AllOrderResponseImplCopyWith<$Res> {
  __$$AllOrderResponseImplCopyWithImpl(_$AllOrderResponseImpl _value,
      $Res Function(_$AllOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AllOrderResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllOrderResponseImpl implements _AllOrderResponse {
  _$AllOrderResponseImpl({this.data, this.success, this.message});

  factory _$AllOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllOrderResponseImplFromJson(json);

  @override
  final Data? data;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'AllOrderResponse(data: $data, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllOrderResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, success, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllOrderResponseImplCopyWith<_$AllOrderResponseImpl> get copyWith =>
      __$$AllOrderResponseImplCopyWithImpl<_$AllOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _AllOrderResponse implements AllOrderResponse {
  factory _AllOrderResponse(
      {final Data? data,
      final bool? success,
      final String? message}) = _$AllOrderResponseImpl;

  factory _AllOrderResponse.fromJson(Map<String, dynamic> json) =
      _$AllOrderResponseImpl.fromJson;

  @override
  Data? get data;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AllOrderResponseImplCopyWith<_$AllOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

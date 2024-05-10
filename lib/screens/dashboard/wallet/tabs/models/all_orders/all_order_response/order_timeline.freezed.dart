// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTimeline _$OrderTimelineFromJson(Map<String, dynamic> json) {
  return _OrderTimeline.fromJson(json);
}

/// @nodoc
mixin _$OrderTimeline {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_status')
  dynamic get fromStatus => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTimelineCopyWith<OrderTimeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTimelineCopyWith<$Res> {
  factory $OrderTimelineCopyWith(
          OrderTimeline value, $Res Function(OrderTimeline) then) =
      _$OrderTimelineCopyWithImpl<$Res, OrderTimeline>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'from_status') dynamic fromStatus,
      String? status,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$OrderTimelineCopyWithImpl<$Res, $Val extends OrderTimeline>
    implements $OrderTimelineCopyWith<$Res> {
  _$OrderTimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fromStatus = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStatus: freezed == fromStatus
          ? _value.fromStatus
          : fromStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderTimelineImplCopyWith<$Res>
    implements $OrderTimelineCopyWith<$Res> {
  factory _$$OrderTimelineImplCopyWith(
          _$OrderTimelineImpl value, $Res Function(_$OrderTimelineImpl) then) =
      __$$OrderTimelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'from_status') dynamic fromStatus,
      String? status,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$OrderTimelineImplCopyWithImpl<$Res>
    extends _$OrderTimelineCopyWithImpl<$Res, _$OrderTimelineImpl>
    implements _$$OrderTimelineImplCopyWith<$Res> {
  __$$OrderTimelineImplCopyWithImpl(
      _$OrderTimelineImpl _value, $Res Function(_$OrderTimelineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fromStatus = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$OrderTimelineImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fromStatus: freezed == fromStatus
          ? _value.fromStatus
          : fromStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTimelineImpl implements _OrderTimeline {
  _$OrderTimelineImpl(
      {this.id,
      @JsonKey(name: 'from_status') this.fromStatus,
      this.status,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$OrderTimelineImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTimelineImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'from_status')
  final dynamic fromStatus;
  @override
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OrderTimeline(id: $id, fromStatus: $fromStatus, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTimelineImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.fromStatus, fromStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(fromStatus), status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTimelineImplCopyWith<_$OrderTimelineImpl> get copyWith =>
      __$$OrderTimelineImplCopyWithImpl<_$OrderTimelineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTimelineImplToJson(
      this,
    );
  }
}

abstract class _OrderTimeline implements OrderTimeline {
  factory _OrderTimeline(
          {final String? id,
          @JsonKey(name: 'from_status') final dynamic fromStatus,
          final String? status,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$OrderTimelineImpl;

  factory _OrderTimeline.fromJson(Map<String, dynamic> json) =
      _$OrderTimelineImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'from_status')
  dynamic get fromStatus;
  @override
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderTimelineImplCopyWith<_$OrderTimelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_duration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerDuration _$TimerDurationFromJson(Map<String, dynamic> json) {
  return _TimerDuration.fromJson(json);
}

/// @nodoc
mixin _$TimerDuration {
  String? get hour => throw _privateConstructorUsedError;
  String? get minutes => throw _privateConstructorUsedError;
  String? get seconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerDurationCopyWith<TimerDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerDurationCopyWith<$Res> {
  factory $TimerDurationCopyWith(
          TimerDuration value, $Res Function(TimerDuration) then) =
      _$TimerDurationCopyWithImpl<$Res, TimerDuration>;
  @useResult
  $Res call({String? hour, String? minutes, String? seconds});
}

/// @nodoc
class _$TimerDurationCopyWithImpl<$Res, $Val extends TimerDuration>
    implements $TimerDurationCopyWith<$Res> {
  _$TimerDurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = freezed,
    Object? minutes = freezed,
    Object? seconds = freezed,
  }) {
    return _then(_value.copyWith(
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as String?,
      seconds: freezed == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerDurationImplCopyWith<$Res>
    implements $TimerDurationCopyWith<$Res> {
  factory _$$TimerDurationImplCopyWith(
          _$TimerDurationImpl value, $Res Function(_$TimerDurationImpl) then) =
      __$$TimerDurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hour, String? minutes, String? seconds});
}

/// @nodoc
class __$$TimerDurationImplCopyWithImpl<$Res>
    extends _$TimerDurationCopyWithImpl<$Res, _$TimerDurationImpl>
    implements _$$TimerDurationImplCopyWith<$Res> {
  __$$TimerDurationImplCopyWithImpl(
      _$TimerDurationImpl _value, $Res Function(_$TimerDurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = freezed,
    Object? minutes = freezed,
    Object? seconds = freezed,
  }) {
    return _then(_$TimerDurationImpl(
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      minutes: freezed == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as String?,
      seconds: freezed == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerDurationImpl implements _TimerDuration {
  _$TimerDurationImpl({this.hour, this.minutes, this.seconds});

  factory _$TimerDurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerDurationImplFromJson(json);

  @override
  final String? hour;
  @override
  final String? minutes;
  @override
  final String? seconds;

  @override
  String toString() {
    return 'TimerDuration(hour: $hour, minutes: $minutes, seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerDurationImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minutes, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerDurationImplCopyWith<_$TimerDurationImpl> get copyWith =>
      __$$TimerDurationImplCopyWithImpl<_$TimerDurationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerDurationImplToJson(
      this,
    );
  }
}

abstract class _TimerDuration implements TimerDuration {
  factory _TimerDuration(
      {final String? hour,
      final String? minutes,
      final String? seconds}) = _$TimerDurationImpl;

  factory _TimerDuration.fromJson(Map<String, dynamic> json) =
      _$TimerDurationImpl.fromJson;

  @override
  String? get hour;
  @override
  String? get minutes;
  @override
  String? get seconds;
  @override
  @JsonKey(ignore: true)
  _$$TimerDurationImplCopyWith<_$TimerDurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerBox _$TimerBoxFromJson(Map<String, dynamic> json) {
  return _TimerBox.fromJson(json);
}

/// @nodoc
mixin _$TimerBox {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerBoxCopyWith<TimerBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerBoxCopyWith<$Res> {
  factory $TimerBoxCopyWith(TimerBox value, $Res Function(TimerBox) then) =
      _$TimerBoxCopyWithImpl<$Res, TimerBox>;
  @useResult
  $Res call({int? id, String? name, String? duration});
}

/// @nodoc
class _$TimerBoxCopyWithImpl<$Res, $Val extends TimerBox>
    implements $TimerBoxCopyWith<$Res> {
  _$TimerBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerBoxImplCopyWith<$Res>
    implements $TimerBoxCopyWith<$Res> {
  factory _$$TimerBoxImplCopyWith(
          _$TimerBoxImpl value, $Res Function(_$TimerBoxImpl) then) =
      __$$TimerBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? duration});
}

/// @nodoc
class __$$TimerBoxImplCopyWithImpl<$Res>
    extends _$TimerBoxCopyWithImpl<$Res, _$TimerBoxImpl>
    implements _$$TimerBoxImplCopyWith<$Res> {
  __$$TimerBoxImplCopyWithImpl(
      _$TimerBoxImpl _value, $Res Function(_$TimerBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$TimerBoxImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerBoxImpl implements _TimerBox {
  _$TimerBoxImpl({this.id, this.name, this.duration});

  factory _$TimerBoxImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerBoxImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? duration;

  @override
  String toString() {
    return 'TimerBox(id: $id, name: $name, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerBoxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerBoxImplCopyWith<_$TimerBoxImpl> get copyWith =>
      __$$TimerBoxImplCopyWithImpl<_$TimerBoxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerBoxImplToJson(
      this,
    );
  }
}

abstract class _TimerBox implements TimerBox {
  factory _TimerBox(
      {final int? id,
      final String? name,
      final String? duration}) = _$TimerBoxImpl;

  factory _TimerBox.fromJson(Map<String, dynamic> json) =
      _$TimerBoxImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get duration;
  @override
  @JsonKey(ignore: true)
  _$$TimerBoxImplCopyWith<_$TimerBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

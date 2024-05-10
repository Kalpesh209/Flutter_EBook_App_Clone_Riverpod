// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentType _$ContentTypeFromJson(Map<String, dynamic> json) {
  return _ContentType.fromJson(json);
}

/// @nodoc
mixin _$ContentType {
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentTypeCopyWith<ContentType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentTypeCopyWith<$Res> {
  factory $ContentTypeCopyWith(
          ContentType value, $Res Function(ContentType) then) =
      _$ContentTypeCopyWithImpl<$Res, ContentType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName});
}

/// @nodoc
class _$ContentTypeCopyWithImpl<$Res, $Val extends ContentType>
    implements $ContentTypeCopyWith<$Res> {
  _$ContentTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentTypeImplCopyWith<$Res>
    implements $ContentTypeCopyWith<$Res> {
  factory _$$ContentTypeImplCopyWith(
          _$ContentTypeImpl value, $Res Function(_$ContentTypeImpl) then) =
      __$$ContentTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName});
}

/// @nodoc
class __$$ContentTypeImplCopyWithImpl<$Res>
    extends _$ContentTypeCopyWithImpl<$Res, _$ContentTypeImpl>
    implements _$$ContentTypeImplCopyWith<$Res> {
  __$$ContentTypeImplCopyWithImpl(
      _$ContentTypeImpl _value, $Res Function(_$ContentTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$ContentTypeImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentTypeImpl implements _ContentType {
  _$ContentTypeImpl(
      {@JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName});

  factory _$ContentTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentTypeImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;

  @override
  String toString() {
    return 'ContentType(categoryId: $categoryId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentTypeImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentTypeImplCopyWith<_$ContentTypeImpl> get copyWith =>
      __$$ContentTypeImplCopyWithImpl<_$ContentTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentTypeImplToJson(
      this,
    );
  }
}

abstract class _ContentType implements ContentType {
  factory _ContentType(
          {@JsonKey(name: 'category_id') final String? categoryId,
          @JsonKey(name: 'category_name') final String? categoryName}) =
      _$ContentTypeImpl;

  factory _ContentType.fromJson(Map<String, dynamic> json) =
      _$ContentTypeImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$ContentTypeImplCopyWith<_$ContentTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

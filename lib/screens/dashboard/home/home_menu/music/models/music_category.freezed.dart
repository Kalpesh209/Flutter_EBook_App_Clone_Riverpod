// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicCategory _$MusicCategoryFromJson(Map<String, dynamic> json) {
  return _MusicCategory.fromJson(json);
}

/// @nodoc
mixin _$MusicCategory {
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicCategoryCopyWith<MusicCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicCategoryCopyWith<$Res> {
  factory $MusicCategoryCopyWith(
          MusicCategory value, $Res Function(MusicCategory) then) =
      _$MusicCategoryCopyWithImpl<$Res, MusicCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName});
}

/// @nodoc
class _$MusicCategoryCopyWithImpl<$Res, $Val extends MusicCategory>
    implements $MusicCategoryCopyWith<$Res> {
  _$MusicCategoryCopyWithImpl(this._value, this._then);

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
abstract class _$$MusicCategoryImplCopyWith<$Res>
    implements $MusicCategoryCopyWith<$Res> {
  factory _$$MusicCategoryImplCopyWith(
          _$MusicCategoryImpl value, $Res Function(_$MusicCategoryImpl) then) =
      __$$MusicCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName});
}

/// @nodoc
class __$$MusicCategoryImplCopyWithImpl<$Res>
    extends _$MusicCategoryCopyWithImpl<$Res, _$MusicCategoryImpl>
    implements _$$MusicCategoryImplCopyWith<$Res> {
  __$$MusicCategoryImplCopyWithImpl(
      _$MusicCategoryImpl _value, $Res Function(_$MusicCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$MusicCategoryImpl(
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
class _$MusicCategoryImpl implements _MusicCategory {
  _$MusicCategoryImpl(
      {@JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName});

  factory _$MusicCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;

  @override
  String toString() {
    return 'MusicCategory(categoryId: $categoryId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicCategoryImpl &&
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
  _$$MusicCategoryImplCopyWith<_$MusicCategoryImpl> get copyWith =>
      __$$MusicCategoryImplCopyWithImpl<_$MusicCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicCategoryImplToJson(
      this,
    );
  }
}

abstract class _MusicCategory implements MusicCategory {
  factory _MusicCategory(
          {@JsonKey(name: 'category_id') final String? categoryId,
          @JsonKey(name: 'category_name') final String? categoryName}) =
      _$MusicCategoryImpl;

  factory _MusicCategory.fromJson(Map<String, dynamic> json) =
      _$MusicCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$MusicCategoryImplCopyWith<_$MusicCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

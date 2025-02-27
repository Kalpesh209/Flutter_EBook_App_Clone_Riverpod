// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meditation_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeditationCategory _$MeditationCategoryFromJson(Map<String, dynamic> json) {
  return _MeditationCategory.fromJson(json);
}

/// @nodoc
mixin _$MeditationCategory {
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeditationCategoryCopyWith<MeditationCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeditationCategoryCopyWith<$Res> {
  factory $MeditationCategoryCopyWith(
          MeditationCategory value, $Res Function(MeditationCategory) then) =
      _$MeditationCategoryCopyWithImpl<$Res, MeditationCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName});
}

/// @nodoc
class _$MeditationCategoryCopyWithImpl<$Res, $Val extends MeditationCategory>
    implements $MeditationCategoryCopyWith<$Res> {
  _$MeditationCategoryCopyWithImpl(this._value, this._then);

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
abstract class _$$MeditationCategoryImplCopyWith<$Res>
    implements $MeditationCategoryCopyWith<$Res> {
  factory _$$MeditationCategoryImplCopyWith(_$MeditationCategoryImpl value,
          $Res Function(_$MeditationCategoryImpl) then) =
      __$$MeditationCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName});
}

/// @nodoc
class __$$MeditationCategoryImplCopyWithImpl<$Res>
    extends _$MeditationCategoryCopyWithImpl<$Res, _$MeditationCategoryImpl>
    implements _$$MeditationCategoryImplCopyWith<$Res> {
  __$$MeditationCategoryImplCopyWithImpl(_$MeditationCategoryImpl _value,
      $Res Function(_$MeditationCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$MeditationCategoryImpl(
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
class _$MeditationCategoryImpl implements _MeditationCategory {
  _$MeditationCategoryImpl(
      {@JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName});

  factory _$MeditationCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeditationCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;

  @override
  String toString() {
    return 'MeditationCategory(categoryId: $categoryId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeditationCategoryImpl &&
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
  _$$MeditationCategoryImplCopyWith<_$MeditationCategoryImpl> get copyWith =>
      __$$MeditationCategoryImplCopyWithImpl<_$MeditationCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeditationCategoryImplToJson(
      this,
    );
  }
}

abstract class _MeditationCategory implements MeditationCategory {
  factory _MeditationCategory(
          {@JsonKey(name: 'category_id') final String? categoryId,
          @JsonKey(name: 'category_name') final String? categoryName}) =
      _$MeditationCategoryImpl;

  factory _MeditationCategory.fromJson(Map<String, dynamic> json) =
      _$MeditationCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$MeditationCategoryImplCopyWith<_$MeditationCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

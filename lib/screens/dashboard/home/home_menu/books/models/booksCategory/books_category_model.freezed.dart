// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryEbookResponse _$CategoryEbookResponseFromJson(
    Map<String, dynamic> json) {
  return _CategoryEbookResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryEbookResponse {
  CategoryEbookData? get data => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryEbookResponseCopyWith<CategoryEbookResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEbookResponseCopyWith<$Res> {
  factory $CategoryEbookResponseCopyWith(CategoryEbookResponse value,
          $Res Function(CategoryEbookResponse) then) =
      _$CategoryEbookResponseCopyWithImpl<$Res, CategoryEbookResponse>;
  @useResult
  $Res call({CategoryEbookData? data, bool? success, String? message});

  $CategoryEbookDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CategoryEbookResponseCopyWithImpl<$Res,
        $Val extends CategoryEbookResponse>
    implements $CategoryEbookResponseCopyWith<$Res> {
  _$CategoryEbookResponseCopyWithImpl(this._value, this._then);

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
              as CategoryEbookData?,
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
  $CategoryEbookDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CategoryEbookDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryEbookResponseImplCopyWith<$Res>
    implements $CategoryEbookResponseCopyWith<$Res> {
  factory _$$CategoryEbookResponseImplCopyWith(
          _$CategoryEbookResponseImpl value,
          $Res Function(_$CategoryEbookResponseImpl) then) =
      __$$CategoryEbookResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryEbookData? data, bool? success, String? message});

  @override
  $CategoryEbookDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CategoryEbookResponseImplCopyWithImpl<$Res>
    extends _$CategoryEbookResponseCopyWithImpl<$Res,
        _$CategoryEbookResponseImpl>
    implements _$$CategoryEbookResponseImplCopyWith<$Res> {
  __$$CategoryEbookResponseImplCopyWithImpl(_$CategoryEbookResponseImpl _value,
      $Res Function(_$CategoryEbookResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$CategoryEbookResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CategoryEbookData?,
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
class _$CategoryEbookResponseImpl implements _CategoryEbookResponse {
  _$CategoryEbookResponseImpl({this.data, this.success, this.message});

  factory _$CategoryEbookResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryEbookResponseImplFromJson(json);

  @override
  final CategoryEbookData? data;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'CategoryEbookResponse(data: $data, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEbookResponseImpl &&
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
  _$$CategoryEbookResponseImplCopyWith<_$CategoryEbookResponseImpl>
      get copyWith => __$$CategoryEbookResponseImplCopyWithImpl<
          _$CategoryEbookResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryEbookResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryEbookResponse implements CategoryEbookResponse {
  factory _CategoryEbookResponse(
      {final CategoryEbookData? data,
      final bool? success,
      final String? message}) = _$CategoryEbookResponseImpl;

  factory _CategoryEbookResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryEbookResponseImpl.fromJson;

  @override
  CategoryEbookData? get data;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$CategoryEbookResponseImplCopyWith<_$CategoryEbookResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  List<BookDetailsModal>? get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      List<BookDetailsModal>? books});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? books = freezed,
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
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookDetailsModal>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      List<BookDetailsModal>? books});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? books = freezed,
  }) {
    return _then(_$CategoryImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookDetailsModal>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  _$CategoryImpl(
      {@JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      final List<BookDetailsModal>? books})
      : _books = books;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  final List<BookDetailsModal>? _books;
  @override
  List<BookDetailsModal>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, categoryName: $categoryName, books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  factory _Category(
      {@JsonKey(name: 'category_id') final String? categoryId,
      @JsonKey(name: 'category_name') final String? categoryName,
      final List<BookDetailsModal>? books}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  List<BookDetailsModal>? get books;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryEbookData _$CategoryEbookDataFromJson(Map<String, dynamic> json) {
  return _CategoryEbookData.fromJson(json);
}

/// @nodoc
mixin _$CategoryEbookData {
  List<Category>? get category => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get AllCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryEbookDataCopyWith<CategoryEbookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEbookDataCopyWith<$Res> {
  factory $CategoryEbookDataCopyWith(
          CategoryEbookData value, $Res Function(CategoryEbookData) then) =
      _$CategoryEbookDataCopyWithImpl<$Res, CategoryEbookData>;
  @useResult
  $Res call({List<Category>? category, int? count, int? AllCount});
}

/// @nodoc
class _$CategoryEbookDataCopyWithImpl<$Res, $Val extends CategoryEbookData>
    implements $CategoryEbookDataCopyWith<$Res> {
  _$CategoryEbookDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? count = freezed,
    Object? AllCount = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      AllCount: freezed == AllCount
          ? _value.AllCount
          : AllCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryEbookDataImplCopyWith<$Res>
    implements $CategoryEbookDataCopyWith<$Res> {
  factory _$$CategoryEbookDataImplCopyWith(_$CategoryEbookDataImpl value,
          $Res Function(_$CategoryEbookDataImpl) then) =
      __$$CategoryEbookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category>? category, int? count, int? AllCount});
}

/// @nodoc
class __$$CategoryEbookDataImplCopyWithImpl<$Res>
    extends _$CategoryEbookDataCopyWithImpl<$Res, _$CategoryEbookDataImpl>
    implements _$$CategoryEbookDataImplCopyWith<$Res> {
  __$$CategoryEbookDataImplCopyWithImpl(_$CategoryEbookDataImpl _value,
      $Res Function(_$CategoryEbookDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? count = freezed,
    Object? AllCount = freezed,
  }) {
    return _then(_$CategoryEbookDataImpl(
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      AllCount: freezed == AllCount
          ? _value.AllCount
          : AllCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryEbookDataImpl implements _CategoryEbookData {
  _$CategoryEbookDataImpl(
      {final List<Category>? category, this.count, this.AllCount})
      : _category = category;

  factory _$CategoryEbookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryEbookDataImplFromJson(json);

  final List<Category>? _category;
  @override
  List<Category>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;
  @override
  final int? AllCount;

  @override
  String toString() {
    return 'CategoryEbookData(category: $category, count: $count, AllCount: $AllCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEbookDataImpl &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.AllCount, AllCount) ||
                other.AllCount == AllCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_category), count, AllCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryEbookDataImplCopyWith<_$CategoryEbookDataImpl> get copyWith =>
      __$$CategoryEbookDataImplCopyWithImpl<_$CategoryEbookDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryEbookDataImplToJson(
      this,
    );
  }
}

abstract class _CategoryEbookData implements CategoryEbookData {
  factory _CategoryEbookData(
      {final List<Category>? category,
      final int? count,
      final int? AllCount}) = _$CategoryEbookDataImpl;

  factory _CategoryEbookData.fromJson(Map<String, dynamic> json) =
      _$CategoryEbookDataImpl.fromJson;

  @override
  List<Category>? get category;
  @override
  int? get count;
  @override
  int? get AllCount;
  @override
  @JsonKey(ignore: true)
  _$$CategoryEbookDataImplCopyWith<_$CategoryEbookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

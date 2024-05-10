// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookOrder _$BookOrderFromJson(Map<String, dynamic> json) {
  return _BookOrder.fromJson(json);
}

/// @nodoc
mixin _$BookOrder {
  @JsonKey(name: 'order_id')
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_title')
  String? get bookTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_year')
  int? get releaseYear => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_tag')
  String? get bookTag => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_publish')
  bool? get isPublish => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String? get orderNumber => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  BookMaster? get bookMaster => throw _privateConstructorUsedError;
  List<OrderAddress>? get orderAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  String? get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'assign_date')
  dynamic get assignDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_date')
  String? get returnDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  String? get delivaryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String? get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_condition')
  dynamic get bookCondition => throw _privateConstructorUsedError;
  dynamic get image => throw _privateConstructorUsedError;
  dynamic get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_timeline')
  List<OrderTimeline>? get orderTimeline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookOrderCopyWith<BookOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookOrderCopyWith<$Res> {
  factory $BookOrderCopyWith(BookOrder value, $Res Function(BookOrder) then) =
      _$BookOrderCopyWithImpl<$Res, BookOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'release_year') int? releaseYear,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'book_tag') String? bookTag,
      String? tag,
      @JsonKey(name: 'is_publish') bool? isPublish,
      @JsonKey(name: 'order_number') String? orderNumber,
      User? user,
      BookMaster? bookMaster,
      List<OrderAddress>? orderAddress,
      @JsonKey(name: 'order_date') String? orderDate,
      @JsonKey(name: 'assign_date') dynamic assignDate,
      @JsonKey(name: 'return_date') String? returnDate,
      @JsonKey(name: 'delivery_date') String? delivaryDate,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'book_condition') dynamic bookCondition,
      dynamic image,
      dynamic remark,
      @JsonKey(name: 'order_timeline') List<OrderTimeline>? orderTimeline});

  $UserCopyWith<$Res>? get user;
  $BookMasterCopyWith<$Res>? get bookMaster;
}

/// @nodoc
class _$BookOrderCopyWithImpl<$Res, $Val extends BookOrder>
    implements $BookOrderCopyWith<$Res> {
  _$BookOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? bookTitle = freezed,
    Object? releaseYear = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? bookTag = freezed,
    Object? tag = freezed,
    Object? isPublish = freezed,
    Object? orderNumber = freezed,
    Object? user = freezed,
    Object? bookMaster = freezed,
    Object? orderAddress = freezed,
    Object? orderDate = freezed,
    Object? assignDate = freezed,
    Object? returnDate = freezed,
    Object? delivaryDate = freezed,
    Object? orderStatus = freezed,
    Object? bookCondition = freezed,
    Object? image = freezed,
    Object? remark = freezed,
    Object? orderTimeline = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTag: freezed == bookTag
          ? _value.bookTag
          : bookTag // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      bookMaster: freezed == bookMaster
          ? _value.bookMaster
          : bookMaster // ignore: cast_nullable_to_non_nullable
              as BookMaster?,
      orderAddress: freezed == orderAddress
          ? _value.orderAddress
          : orderAddress // ignore: cast_nullable_to_non_nullable
              as List<OrderAddress>?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String?,
      assignDate: freezed == assignDate
          ? _value.assignDate
          : assignDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      delivaryDate: freezed == delivaryDate
          ? _value.delivaryDate
          : delivaryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      bookCondition: freezed == bookCondition
          ? _value.bookCondition
          : bookCondition // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderTimeline: freezed == orderTimeline
          ? _value.orderTimeline
          : orderTimeline // ignore: cast_nullable_to_non_nullable
              as List<OrderTimeline>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BookMasterCopyWith<$Res>? get bookMaster {
    if (_value.bookMaster == null) {
      return null;
    }

    return $BookMasterCopyWith<$Res>(_value.bookMaster!, (value) {
      return _then(_value.copyWith(bookMaster: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookOrderImplCopyWith<$Res>
    implements $BookOrderCopyWith<$Res> {
  factory _$$BookOrderImplCopyWith(
          _$BookOrderImpl value, $Res Function(_$BookOrderImpl) then) =
      __$$BookOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'release_year') int? releaseYear,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'book_tag') String? bookTag,
      String? tag,
      @JsonKey(name: 'is_publish') bool? isPublish,
      @JsonKey(name: 'order_number') String? orderNumber,
      User? user,
      BookMaster? bookMaster,
      List<OrderAddress>? orderAddress,
      @JsonKey(name: 'order_date') String? orderDate,
      @JsonKey(name: 'assign_date') dynamic assignDate,
      @JsonKey(name: 'return_date') String? returnDate,
      @JsonKey(name: 'delivery_date') String? delivaryDate,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'book_condition') dynamic bookCondition,
      dynamic image,
      dynamic remark,
      @JsonKey(name: 'order_timeline') List<OrderTimeline>? orderTimeline});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $BookMasterCopyWith<$Res>? get bookMaster;
}

/// @nodoc
class __$$BookOrderImplCopyWithImpl<$Res>
    extends _$BookOrderCopyWithImpl<$Res, _$BookOrderImpl>
    implements _$$BookOrderImplCopyWith<$Res> {
  __$$BookOrderImplCopyWithImpl(
      _$BookOrderImpl _value, $Res Function(_$BookOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? bookTitle = freezed,
    Object? releaseYear = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? bookTag = freezed,
    Object? tag = freezed,
    Object? isPublish = freezed,
    Object? orderNumber = freezed,
    Object? user = freezed,
    Object? bookMaster = freezed,
    Object? orderAddress = freezed,
    Object? orderDate = freezed,
    Object? assignDate = freezed,
    Object? returnDate = freezed,
    Object? delivaryDate = freezed,
    Object? orderStatus = freezed,
    Object? bookCondition = freezed,
    Object? image = freezed,
    Object? remark = freezed,
    Object? orderTimeline = freezed,
  }) {
    return _then(_$BookOrderImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTag: freezed == bookTag
          ? _value.bookTag
          : bookTag // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      bookMaster: freezed == bookMaster
          ? _value.bookMaster
          : bookMaster // ignore: cast_nullable_to_non_nullable
              as BookMaster?,
      orderAddress: freezed == orderAddress
          ? _value._orderAddress
          : orderAddress // ignore: cast_nullable_to_non_nullable
              as List<OrderAddress>?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String?,
      assignDate: freezed == assignDate
          ? _value.assignDate
          : assignDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      delivaryDate: freezed == delivaryDate
          ? _value.delivaryDate
          : delivaryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      bookCondition: freezed == bookCondition
          ? _value.bookCondition
          : bookCondition // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderTimeline: freezed == orderTimeline
          ? _value._orderTimeline
          : orderTimeline // ignore: cast_nullable_to_non_nullable
              as List<OrderTimeline>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookOrderImpl implements _BookOrder {
  _$BookOrderImpl(
      {@JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'book_title') this.bookTitle,
      @JsonKey(name: 'release_year') this.releaseYear,
      this.language,
      this.about,
      @JsonKey(name: 'cover_image') this.coverImage,
      @JsonKey(name: 'book_tag') this.bookTag,
      this.tag,
      @JsonKey(name: 'is_publish') this.isPublish,
      @JsonKey(name: 'order_number') this.orderNumber,
      this.user,
      this.bookMaster,
      final List<OrderAddress>? orderAddress,
      @JsonKey(name: 'order_date') this.orderDate,
      @JsonKey(name: 'assign_date') this.assignDate,
      @JsonKey(name: 'return_date') this.returnDate,
      @JsonKey(name: 'delivery_date') this.delivaryDate,
      @JsonKey(name: 'order_status') this.orderStatus,
      @JsonKey(name: 'book_condition') this.bookCondition,
      this.image,
      this.remark,
      @JsonKey(name: 'order_timeline')
      final List<OrderTimeline>? orderTimeline})
      : _orderAddress = orderAddress,
        _orderTimeline = orderTimeline;

  factory _$BookOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookOrderImplFromJson(json);

  @override
  @JsonKey(name: 'order_id')
  final String? orderId;
  @override
  @JsonKey(name: 'book_title')
  final String? bookTitle;
  @override
  @JsonKey(name: 'release_year')
  final int? releaseYear;
  @override
  final String? language;
  @override
  final String? about;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'book_tag')
  final String? bookTag;
  @override
  final String? tag;
  @override
  @JsonKey(name: 'is_publish')
  final bool? isPublish;
  @override
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  @override
  final User? user;
  @override
  final BookMaster? bookMaster;
  final List<OrderAddress>? _orderAddress;
  @override
  List<OrderAddress>? get orderAddress {
    final value = _orderAddress;
    if (value == null) return null;
    if (_orderAddress is EqualUnmodifiableListView) return _orderAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'order_date')
  final String? orderDate;
  @override
  @JsonKey(name: 'assign_date')
  final dynamic assignDate;
  @override
  @JsonKey(name: 'return_date')
  final String? returnDate;
  @override
  @JsonKey(name: 'delivery_date')
  final String? delivaryDate;
  @override
  @JsonKey(name: 'order_status')
  final String? orderStatus;
  @override
  @JsonKey(name: 'book_condition')
  final dynamic bookCondition;
  @override
  final dynamic image;
  @override
  final dynamic remark;
  final List<OrderTimeline>? _orderTimeline;
  @override
  @JsonKey(name: 'order_timeline')
  List<OrderTimeline>? get orderTimeline {
    final value = _orderTimeline;
    if (value == null) return null;
    if (_orderTimeline is EqualUnmodifiableListView) return _orderTimeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookOrder(orderId: $orderId, bookTitle: $bookTitle, releaseYear: $releaseYear, language: $language, about: $about, coverImage: $coverImage, bookTag: $bookTag, tag: $tag, isPublish: $isPublish, orderNumber: $orderNumber, user: $user, bookMaster: $bookMaster, orderAddress: $orderAddress, orderDate: $orderDate, assignDate: $assignDate, returnDate: $returnDate, delivaryDate: $delivaryDate, orderStatus: $orderStatus, bookCondition: $bookCondition, image: $image, remark: $remark, orderTimeline: $orderTimeline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.bookTag, bookTag) || other.bookTag == bookTag) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.bookMaster, bookMaster) ||
                other.bookMaster == bookMaster) &&
            const DeepCollectionEquality()
                .equals(other._orderAddress, _orderAddress) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            const DeepCollectionEquality()
                .equals(other.assignDate, assignDate) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.delivaryDate, delivaryDate) ||
                other.delivaryDate == delivaryDate) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            const DeepCollectionEquality()
                .equals(other.bookCondition, bookCondition) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            const DeepCollectionEquality()
                .equals(other._orderTimeline, _orderTimeline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderId,
        bookTitle,
        releaseYear,
        language,
        about,
        coverImage,
        bookTag,
        tag,
        isPublish,
        orderNumber,
        user,
        bookMaster,
        const DeepCollectionEquality().hash(_orderAddress),
        orderDate,
        const DeepCollectionEquality().hash(assignDate),
        returnDate,
        delivaryDate,
        orderStatus,
        const DeepCollectionEquality().hash(bookCondition),
        const DeepCollectionEquality().hash(image),
        const DeepCollectionEquality().hash(remark),
        const DeepCollectionEquality().hash(_orderTimeline)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookOrderImplCopyWith<_$BookOrderImpl> get copyWith =>
      __$$BookOrderImplCopyWithImpl<_$BookOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookOrderImplToJson(
      this,
    );
  }
}

abstract class _BookOrder implements BookOrder {
  factory _BookOrder(
      {@JsonKey(name: 'order_id') final String? orderId,
      @JsonKey(name: 'book_title') final String? bookTitle,
      @JsonKey(name: 'release_year') final int? releaseYear,
      final String? language,
      final String? about,
      @JsonKey(name: 'cover_image') final String? coverImage,
      @JsonKey(name: 'book_tag') final String? bookTag,
      final String? tag,
      @JsonKey(name: 'is_publish') final bool? isPublish,
      @JsonKey(name: 'order_number') final String? orderNumber,
      final User? user,
      final BookMaster? bookMaster,
      final List<OrderAddress>? orderAddress,
      @JsonKey(name: 'order_date') final String? orderDate,
      @JsonKey(name: 'assign_date') final dynamic assignDate,
      @JsonKey(name: 'return_date') final String? returnDate,
      @JsonKey(name: 'delivery_date') final String? delivaryDate,
      @JsonKey(name: 'order_status') final String? orderStatus,
      @JsonKey(name: 'book_condition') final dynamic bookCondition,
      final dynamic image,
      final dynamic remark,
      @JsonKey(name: 'order_timeline')
      final List<OrderTimeline>? orderTimeline}) = _$BookOrderImpl;

  factory _BookOrder.fromJson(Map<String, dynamic> json) =
      _$BookOrderImpl.fromJson;

  @override
  @JsonKey(name: 'order_id')
  String? get orderId;
  @override
  @JsonKey(name: 'book_title')
  String? get bookTitle;
  @override
  @JsonKey(name: 'release_year')
  int? get releaseYear;
  @override
  String? get language;
  @override
  String? get about;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'book_tag')
  String? get bookTag;
  @override
  String? get tag;
  @override
  @JsonKey(name: 'is_publish')
  bool? get isPublish;
  @override
  @JsonKey(name: 'order_number')
  String? get orderNumber;
  @override
  User? get user;
  @override
  BookMaster? get bookMaster;
  @override
  List<OrderAddress>? get orderAddress;
  @override
  @JsonKey(name: 'order_date')
  String? get orderDate;
  @override
  @JsonKey(name: 'assign_date')
  dynamic get assignDate;
  @override
  @JsonKey(name: 'return_date')
  String? get returnDate;
  @override
  @JsonKey(name: 'delivery_date')
  String? get delivaryDate;
  @override
  @JsonKey(name: 'order_status')
  String? get orderStatus;
  @override
  @JsonKey(name: 'book_condition')
  dynamic get bookCondition;
  @override
  dynamic get image;
  @override
  dynamic get remark;
  @override
  @JsonKey(name: 'order_timeline')
  List<OrderTimeline>? get orderTimeline;
  @override
  @JsonKey(ignore: true)
  _$$BookOrderImplCopyWith<_$BookOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

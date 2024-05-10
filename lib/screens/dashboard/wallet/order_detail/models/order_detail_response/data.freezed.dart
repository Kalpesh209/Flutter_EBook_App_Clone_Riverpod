// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String? get orderNumber => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  BookMaster? get bookMaster => throw _privateConstructorUsedError;
  List<OrderAddress>? get orderAddress => throw _privateConstructorUsedError;
  dynamic get bookQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  String? get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'assign_date')
  dynamic get assignDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_date')
  String? get returnDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String? get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_condition')
  dynamic get bookCondition => throw _privateConstructorUsedError;
  dynamic get image => throw _privateConstructorUsedError;
  dynamic get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_delivery_date')
  dynamic get expectedDeliveryDate => throw _privateConstructorUsedError;
  Seller? get seller => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_timeline')
  List<OrderTimeline>? get orderTimeline => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_book_order')
  NextBookOrder? get nextBookOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'order_number') String? orderNumber,
      User? user,
      BookMaster? bookMaster,
      List<OrderAddress>? orderAddress,
      dynamic bookQty,
      @JsonKey(name: 'order_date') String? orderDate,
      @JsonKey(name: 'assign_date') dynamic assignDate,
      @JsonKey(name: 'return_date') String? returnDate,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'book_condition') dynamic bookCondition,
      dynamic image,
      dynamic remark,
      @JsonKey(name: 'expected_delivery_date') dynamic expectedDeliveryDate,
      Seller? seller,
      @JsonKey(name: 'order_timeline') List<OrderTimeline>? orderTimeline,
      @JsonKey(name: 'next_book_order') NextBookOrder? nextBookOrder});

  $UserCopyWith<$Res>? get user;
  $BookMasterCopyWith<$Res>? get bookMaster;
  $SellerCopyWith<$Res>? get seller;
  $NextBookOrderCopyWith<$Res>? get nextBookOrder;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderNumber = freezed,
    Object? user = freezed,
    Object? bookMaster = freezed,
    Object? orderAddress = freezed,
    Object? bookQty = freezed,
    Object? orderDate = freezed,
    Object? assignDate = freezed,
    Object? returnDate = freezed,
    Object? orderStatus = freezed,
    Object? bookCondition = freezed,
    Object? image = freezed,
    Object? remark = freezed,
    Object? expectedDeliveryDate = freezed,
    Object? seller = freezed,
    Object? orderTimeline = freezed,
    Object? nextBookOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      bookQty: freezed == bookQty
          ? _value.bookQty
          : bookQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      expectedDeliveryDate: freezed == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      orderTimeline: freezed == orderTimeline
          ? _value.orderTimeline
          : orderTimeline // ignore: cast_nullable_to_non_nullable
              as List<OrderTimeline>?,
      nextBookOrder: freezed == nextBookOrder
          ? _value.nextBookOrder
          : nextBookOrder // ignore: cast_nullable_to_non_nullable
              as NextBookOrder?,
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

  @override
  @pragma('vm:prefer-inline')
  $SellerCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NextBookOrderCopyWith<$Res>? get nextBookOrder {
    if (_value.nextBookOrder == null) {
      return null;
    }

    return $NextBookOrderCopyWith<$Res>(_value.nextBookOrder!, (value) {
      return _then(_value.copyWith(nextBookOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'order_number') String? orderNumber,
      User? user,
      BookMaster? bookMaster,
      List<OrderAddress>? orderAddress,
      dynamic bookQty,
      @JsonKey(name: 'order_date') String? orderDate,
      @JsonKey(name: 'assign_date') dynamic assignDate,
      @JsonKey(name: 'return_date') String? returnDate,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'book_condition') dynamic bookCondition,
      dynamic image,
      dynamic remark,
      @JsonKey(name: 'expected_delivery_date') dynamic expectedDeliveryDate,
      Seller? seller,
      @JsonKey(name: 'order_timeline') List<OrderTimeline>? orderTimeline,
      @JsonKey(name: 'next_book_order') NextBookOrder? nextBookOrder});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $BookMasterCopyWith<$Res>? get bookMaster;
  @override
  $SellerCopyWith<$Res>? get seller;
  @override
  $NextBookOrderCopyWith<$Res>? get nextBookOrder;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderNumber = freezed,
    Object? user = freezed,
    Object? bookMaster = freezed,
    Object? orderAddress = freezed,
    Object? bookQty = freezed,
    Object? orderDate = freezed,
    Object? assignDate = freezed,
    Object? returnDate = freezed,
    Object? orderStatus = freezed,
    Object? bookCondition = freezed,
    Object? image = freezed,
    Object? remark = freezed,
    Object? expectedDeliveryDate = freezed,
    Object? seller = freezed,
    Object? orderTimeline = freezed,
    Object? nextBookOrder = freezed,
  }) {
    return _then(_$DataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      bookQty: freezed == bookQty
          ? _value.bookQty
          : bookQty // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      expectedDeliveryDate: freezed == expectedDeliveryDate
          ? _value.expectedDeliveryDate
          : expectedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
      orderTimeline: freezed == orderTimeline
          ? _value._orderTimeline
          : orderTimeline // ignore: cast_nullable_to_non_nullable
              as List<OrderTimeline>?,
      nextBookOrder: freezed == nextBookOrder
          ? _value.nextBookOrder
          : nextBookOrder // ignore: cast_nullable_to_non_nullable
              as NextBookOrder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  _$DataImpl(
      {this.id,
      @JsonKey(name: 'order_number') this.orderNumber,
      this.user,
      this.bookMaster,
      final List<OrderAddress>? orderAddress,
      this.bookQty,
      @JsonKey(name: 'order_date') this.orderDate,
      @JsonKey(name: 'assign_date') this.assignDate,
      @JsonKey(name: 'return_date') this.returnDate,
      @JsonKey(name: 'order_status') this.orderStatus,
      @JsonKey(name: 'book_condition') this.bookCondition,
      this.image,
      this.remark,
      @JsonKey(name: 'expected_delivery_date') this.expectedDeliveryDate,
      this.seller,
      @JsonKey(name: 'order_timeline') final List<OrderTimeline>? orderTimeline,
      @JsonKey(name: 'next_book_order') this.nextBookOrder})
      : _orderAddress = orderAddress,
        _orderTimeline = orderTimeline;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final String? id;
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
  final dynamic bookQty;
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
  @JsonKey(name: 'order_status')
  final String? orderStatus;
  @override
  @JsonKey(name: 'book_condition')
  final dynamic bookCondition;
  @override
  final dynamic image;
  @override
  final dynamic remark;
  @override
  @JsonKey(name: 'expected_delivery_date')
  final dynamic expectedDeliveryDate;
  @override
  final Seller? seller;
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
  @JsonKey(name: 'next_book_order')
  final NextBookOrder? nextBookOrder;

  @override
  String toString() {
    return 'Data(id: $id, orderNumber: $orderNumber, user: $user, bookMaster: $bookMaster, orderAddress: $orderAddress, bookQty: $bookQty, orderDate: $orderDate, assignDate: $assignDate, returnDate: $returnDate, orderStatus: $orderStatus, bookCondition: $bookCondition, image: $image, remark: $remark, expectedDeliveryDate: $expectedDeliveryDate, seller: $seller, orderTimeline: $orderTimeline, nextBookOrder: $nextBookOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.bookMaster, bookMaster) ||
                other.bookMaster == bookMaster) &&
            const DeepCollectionEquality()
                .equals(other._orderAddress, _orderAddress) &&
            const DeepCollectionEquality().equals(other.bookQty, bookQty) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            const DeepCollectionEquality()
                .equals(other.assignDate, assignDate) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            const DeepCollectionEquality()
                .equals(other.bookCondition, bookCondition) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            const DeepCollectionEquality()
                .equals(other.expectedDeliveryDate, expectedDeliveryDate) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            const DeepCollectionEquality()
                .equals(other._orderTimeline, _orderTimeline) &&
            (identical(other.nextBookOrder, nextBookOrder) ||
                other.nextBookOrder == nextBookOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      user,
      bookMaster,
      const DeepCollectionEquality().hash(_orderAddress),
      const DeepCollectionEquality().hash(bookQty),
      orderDate,
      const DeepCollectionEquality().hash(assignDate),
      returnDate,
      orderStatus,
      const DeepCollectionEquality().hash(bookCondition),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(remark),
      const DeepCollectionEquality().hash(expectedDeliveryDate),
      seller,
      const DeepCollectionEquality().hash(_orderTimeline),
      nextBookOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {final String? id,
      @JsonKey(name: 'order_number') final String? orderNumber,
      final User? user,
      final BookMaster? bookMaster,
      final List<OrderAddress>? orderAddress,
      final dynamic bookQty,
      @JsonKey(name: 'order_date') final String? orderDate,
      @JsonKey(name: 'assign_date') final dynamic assignDate,
      @JsonKey(name: 'return_date') final String? returnDate,
      @JsonKey(name: 'order_status') final String? orderStatus,
      @JsonKey(name: 'book_condition') final dynamic bookCondition,
      final dynamic image,
      final dynamic remark,
      @JsonKey(name: 'expected_delivery_date')
      final dynamic expectedDeliveryDate,
      final Seller? seller,
      @JsonKey(name: 'order_timeline') final List<OrderTimeline>? orderTimeline,
      @JsonKey(name: 'next_book_order')
      final NextBookOrder? nextBookOrder}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  String? get id;
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
  dynamic get bookQty;
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
  @JsonKey(name: 'expected_delivery_date')
  dynamic get expectedDeliveryDate;
  @override
  Seller? get seller;
  @override
  @JsonKey(name: 'order_timeline')
  List<OrderTimeline>? get orderTimeline;
  @override
  @JsonKey(name: 'next_book_order')
  NextBookOrder? get nextBookOrder;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

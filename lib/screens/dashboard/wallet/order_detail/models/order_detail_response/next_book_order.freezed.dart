// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_book_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NextBookOrder _$NextBookOrderFromJson(Map<String, dynamic> json) {
  return _NextBookOrder.fromJson(json);
}

/// @nodoc
mixin _$NextBookOrder {
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  dynamic get orderNumber => throw _privateConstructorUsedError;
  dynamic get user => throw _privateConstructorUsedError;
  dynamic get bookMaster => throw _privateConstructorUsedError;
  List<OrderAddress>? get orderAddress => throw _privateConstructorUsedError;
  dynamic get bookQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_date')
  dynamic get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'assign_date')
  dynamic get assignDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_date')
  dynamic get returnDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  dynamic get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_condition')
  dynamic get bookCondition => throw _privateConstructorUsedError;
  dynamic get image => throw _privateConstructorUsedError;
  dynamic get remark => throw _privateConstructorUsedError;
  Seller? get seller => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextBookOrderCopyWith<NextBookOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextBookOrderCopyWith<$Res> {
  factory $NextBookOrderCopyWith(
          NextBookOrder value, $Res Function(NextBookOrder) then) =
      _$NextBookOrderCopyWithImpl<$Res, NextBookOrder>;
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: 'order_number') dynamic orderNumber,
      dynamic user,
      dynamic bookMaster,
      List<OrderAddress>? orderAddress,
      dynamic bookQty,
      @JsonKey(name: 'order_date') dynamic orderDate,
      @JsonKey(name: 'assign_date') dynamic assignDate,
      @JsonKey(name: 'return_date') dynamic returnDate,
      @JsonKey(name: 'order_status') dynamic orderStatus,
      @JsonKey(name: 'book_condition') dynamic bookCondition,
      dynamic image,
      dynamic remark,
      Seller? seller});

  $SellerCopyWith<$Res>? get seller;
}

/// @nodoc
class _$NextBookOrderCopyWithImpl<$Res, $Val extends NextBookOrder>
    implements $NextBookOrderCopyWith<$Res> {
  _$NextBookOrderCopyWithImpl(this._value, this._then);

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
    Object? seller = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookMaster: freezed == bookMaster
          ? _value.bookMaster
          : bookMaster // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
      assignDate: freezed == assignDate
          ? _value.assignDate
          : assignDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
    ) as $Val);
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
}

/// @nodoc
abstract class _$$NextBookOrderImplCopyWith<$Res>
    implements $NextBookOrderCopyWith<$Res> {
  factory _$$NextBookOrderImplCopyWith(
          _$NextBookOrderImpl value, $Res Function(_$NextBookOrderImpl) then) =
      __$$NextBookOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: 'order_number') dynamic orderNumber,
      dynamic user,
      dynamic bookMaster,
      List<OrderAddress>? orderAddress,
      dynamic bookQty,
      @JsonKey(name: 'order_date') dynamic orderDate,
      @JsonKey(name: 'assign_date') dynamic assignDate,
      @JsonKey(name: 'return_date') dynamic returnDate,
      @JsonKey(name: 'order_status') dynamic orderStatus,
      @JsonKey(name: 'book_condition') dynamic bookCondition,
      dynamic image,
      dynamic remark,
      Seller? seller});

  @override
  $SellerCopyWith<$Res>? get seller;
}

/// @nodoc
class __$$NextBookOrderImplCopyWithImpl<$Res>
    extends _$NextBookOrderCopyWithImpl<$Res, _$NextBookOrderImpl>
    implements _$$NextBookOrderImplCopyWith<$Res> {
  __$$NextBookOrderImplCopyWithImpl(
      _$NextBookOrderImpl _value, $Res Function(_$NextBookOrderImpl) _then)
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
    Object? seller = freezed,
  }) {
    return _then(_$NextBookOrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookMaster: freezed == bookMaster
          ? _value.bookMaster
          : bookMaster // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
      assignDate: freezed == assignDate
          ? _value.assignDate
          : assignDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as Seller?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NextBookOrderImpl implements _NextBookOrder {
  _$NextBookOrderImpl(
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
      this.seller})
      : _orderAddress = orderAddress;

  factory _$NextBookOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextBookOrderImplFromJson(json);

  @override
  final dynamic id;
  @override
  @JsonKey(name: 'order_number')
  final dynamic orderNumber;
  @override
  final dynamic user;
  @override
  final dynamic bookMaster;
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
  final dynamic orderDate;
  @override
  @JsonKey(name: 'assign_date')
  final dynamic assignDate;
  @override
  @JsonKey(name: 'return_date')
  final dynamic returnDate;
  @override
  @JsonKey(name: 'order_status')
  final dynamic orderStatus;
  @override
  @JsonKey(name: 'book_condition')
  final dynamic bookCondition;
  @override
  final dynamic image;
  @override
  final dynamic remark;
  @override
  final Seller? seller;

  @override
  String toString() {
    return 'NextBookOrder(id: $id, orderNumber: $orderNumber, user: $user, bookMaster: $bookMaster, orderAddress: $orderAddress, bookQty: $bookQty, orderDate: $orderDate, assignDate: $assignDate, returnDate: $returnDate, orderStatus: $orderStatus, bookCondition: $bookCondition, image: $image, remark: $remark, seller: $seller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextBookOrderImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.orderNumber, orderNumber) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.bookMaster, bookMaster) &&
            const DeepCollectionEquality()
                .equals(other._orderAddress, _orderAddress) &&
            const DeepCollectionEquality().equals(other.bookQty, bookQty) &&
            const DeepCollectionEquality().equals(other.orderDate, orderDate) &&
            const DeepCollectionEquality()
                .equals(other.assignDate, assignDate) &&
            const DeepCollectionEquality()
                .equals(other.returnDate, returnDate) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus) &&
            const DeepCollectionEquality()
                .equals(other.bookCondition, bookCondition) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            (identical(other.seller, seller) || other.seller == seller));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orderNumber),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(bookMaster),
      const DeepCollectionEquality().hash(_orderAddress),
      const DeepCollectionEquality().hash(bookQty),
      const DeepCollectionEquality().hash(orderDate),
      const DeepCollectionEquality().hash(assignDate),
      const DeepCollectionEquality().hash(returnDate),
      const DeepCollectionEquality().hash(orderStatus),
      const DeepCollectionEquality().hash(bookCondition),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(remark),
      seller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextBookOrderImplCopyWith<_$NextBookOrderImpl> get copyWith =>
      __$$NextBookOrderImplCopyWithImpl<_$NextBookOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NextBookOrderImplToJson(
      this,
    );
  }
}

abstract class _NextBookOrder implements NextBookOrder {
  factory _NextBookOrder(
      {final dynamic id,
      @JsonKey(name: 'order_number') final dynamic orderNumber,
      final dynamic user,
      final dynamic bookMaster,
      final List<OrderAddress>? orderAddress,
      final dynamic bookQty,
      @JsonKey(name: 'order_date') final dynamic orderDate,
      @JsonKey(name: 'assign_date') final dynamic assignDate,
      @JsonKey(name: 'return_date') final dynamic returnDate,
      @JsonKey(name: 'order_status') final dynamic orderStatus,
      @JsonKey(name: 'book_condition') final dynamic bookCondition,
      final dynamic image,
      final dynamic remark,
      final Seller? seller}) = _$NextBookOrderImpl;

  factory _NextBookOrder.fromJson(Map<String, dynamic> json) =
      _$NextBookOrderImpl.fromJson;

  @override
  dynamic get id;
  @override
  @JsonKey(name: 'order_number')
  dynamic get orderNumber;
  @override
  dynamic get user;
  @override
  dynamic get bookMaster;
  @override
  List<OrderAddress>? get orderAddress;
  @override
  dynamic get bookQty;
  @override
  @JsonKey(name: 'order_date')
  dynamic get orderDate;
  @override
  @JsonKey(name: 'assign_date')
  dynamic get assignDate;
  @override
  @JsonKey(name: 'return_date')
  dynamic get returnDate;
  @override
  @JsonKey(name: 'order_status')
  dynamic get orderStatus;
  @override
  @JsonKey(name: 'book_condition')
  dynamic get bookCondition;
  @override
  dynamic get image;
  @override
  dynamic get remark;
  @override
  Seller? get seller;
  @override
  @JsonKey(ignore: true)
  _$$NextBookOrderImplCopyWith<_$NextBookOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

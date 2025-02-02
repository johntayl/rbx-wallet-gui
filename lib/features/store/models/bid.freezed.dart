// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bid _$BidFromJson(Map<String, dynamic> json) {
  return _Bid.fromJson(json);
}

/// @nodoc
mixin _$Bid {
  @JsonKey(name: "wallet_address")
  String get walletAddress => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "amount_rbx")
  double get amountRbx => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BidCopyWith<Bid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidCopyWith<$Res> {
  factory $BidCopyWith(Bid value, $Res Function(Bid) then) = _$BidCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "wallet_address") String walletAddress,
      double amount,
      @JsonKey(name: "amount_rbx") double amountRbx,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$BidCopyWithImpl<$Res> implements $BidCopyWith<$Res> {
  _$BidCopyWithImpl(this._value, this._then);

  final Bid _value;
  // ignore: unused_field
  final $Res Function(Bid) _then;

  @override
  $Res call({
    Object? walletAddress = freezed,
    Object? amount = freezed,
    Object? amountRbx = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      walletAddress: walletAddress == freezed
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amountRbx: amountRbx == freezed
          ? _value.amountRbx
          : amountRbx // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_BidCopyWith<$Res> implements $BidCopyWith<$Res> {
  factory _$$_BidCopyWith(_$_Bid value, $Res Function(_$_Bid) then) = __$$_BidCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "wallet_address") String walletAddress,
      double amount,
      @JsonKey(name: "amount_rbx") double amountRbx,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_BidCopyWithImpl<$Res> extends _$BidCopyWithImpl<$Res> implements _$$_BidCopyWith<$Res> {
  __$$_BidCopyWithImpl(_$_Bid _value, $Res Function(_$_Bid) _then) : super(_value, (v) => _then(v as _$_Bid));

  @override
  _$_Bid get _value => super._value as _$_Bid;

  @override
  $Res call({
    Object? walletAddress = freezed,
    Object? amount = freezed,
    Object? amountRbx = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Bid(
      walletAddress: walletAddress == freezed
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amountRbx: amountRbx == freezed
          ? _value.amountRbx
          : amountRbx // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bid extends _Bid {
  _$_Bid(
      {@JsonKey(name: "wallet_address") required this.walletAddress,
      required this.amount,
      @JsonKey(name: "amount_rbx") required this.amountRbx,
      @JsonKey(name: "created_at") required this.createdAt})
      : super._();

  factory _$_Bid.fromJson(Map<String, dynamic> json) => _$$_BidFromJson(json);

  @override
  @JsonKey(name: "wallet_address")
  final String walletAddress;
  @override
  final double amount;
  @override
  @JsonKey(name: "amount_rbx")
  final double amountRbx;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'Bid(walletAddress: $walletAddress, amount: $amount, amountRbx: $amountRbx, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bid &&
            const DeepCollectionEquality().equals(other.walletAddress, walletAddress) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.amountRbx, amountRbx) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(walletAddress), const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(amountRbx), const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_BidCopyWith<_$_Bid> get copyWith => __$$_BidCopyWithImpl<_$_Bid>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BidToJson(this);
  }
}

abstract class _Bid extends Bid {
  factory _Bid(
      {@JsonKey(name: "wallet_address") required final String walletAddress,
      required final double amount,
      @JsonKey(name: "amount_rbx") required final double amountRbx,
      @JsonKey(name: "created_at") required final DateTime createdAt}) = _$_Bid;
  _Bid._() : super._();

  factory _Bid.fromJson(Map<String, dynamic> json) = _$_Bid.fromJson;

  @override
  @JsonKey(name: "wallet_address")
  String get walletAddress => throw _privateConstructorUsedError;
  @override
  double get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "amount_rbx")
  double get amountRbx => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BidCopyWith<_$_Bid> get copyWith => throw _privateConstructorUsedError;
}

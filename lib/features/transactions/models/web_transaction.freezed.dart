// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebTransaction _$WebTransactionFromJson(Map<String, dynamic> json) {
  return _WebTransaction.fromJson(json);
}

/// @nodoc
mixin _$WebTransaction {
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_address')
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_address')
  String get fromAddress => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_fee")
  double? get fee => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_crafted')
  DateTime get date => throw _privateConstructorUsedError; // required int nonce,
// required int timestamp,
// @JsonKey(name: 'nft_data') dynamic nftData,
// required String signature,
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebTransactionCopyWith<WebTransaction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebTransactionCopyWith<$Res> {
  factory $WebTransactionCopyWith(WebTransaction value, $Res Function(WebTransaction) then) = _$WebTransactionCopyWithImpl<$Res>;
  $Res call(
      {String hash,
      @JsonKey(name: 'to_address') String toAddress,
      @JsonKey(name: 'from_address') String fromAddress,
      int type,
      @JsonKey(name: "total_amount") double? amount,
      @JsonKey(name: "total_fee") double? fee,
      @JsonKey(name: 'date_crafted') DateTime date,
      int height});
}

/// @nodoc
class _$WebTransactionCopyWithImpl<$Res> implements $WebTransactionCopyWith<$Res> {
  _$WebTransactionCopyWithImpl(this._value, this._then);

  final WebTransaction _value;
  // ignore: unused_field
  final $Res Function(WebTransaction) _then;

  @override
  $Res call({
    Object? hash = freezed,
    Object? toAddress = freezed,
    Object? fromAddress = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? date = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: fromAddress == freezed
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WebTransactionCopyWith<$Res> implements $WebTransactionCopyWith<$Res> {
  factory _$$_WebTransactionCopyWith(_$_WebTransaction value, $Res Function(_$_WebTransaction) then) = __$$_WebTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String hash,
      @JsonKey(name: 'to_address') String toAddress,
      @JsonKey(name: 'from_address') String fromAddress,
      int type,
      @JsonKey(name: "total_amount") double? amount,
      @JsonKey(name: "total_fee") double? fee,
      @JsonKey(name: 'date_crafted') DateTime date,
      int height});
}

/// @nodoc
class __$$_WebTransactionCopyWithImpl<$Res> extends _$WebTransactionCopyWithImpl<$Res> implements _$$_WebTransactionCopyWith<$Res> {
  __$$_WebTransactionCopyWithImpl(_$_WebTransaction _value, $Res Function(_$_WebTransaction) _then)
      : super(_value, (v) => _then(v as _$_WebTransaction));

  @override
  _$_WebTransaction get _value => super._value as _$_WebTransaction;

  @override
  $Res call({
    Object? hash = freezed,
    Object? toAddress = freezed,
    Object? fromAddress = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? date = freezed,
    Object? height = freezed,
  }) {
    return _then(_$_WebTransaction(
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: fromAddress == freezed
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebTransaction extends _WebTransaction {
  _$_WebTransaction(
      {required this.hash,
      @JsonKey(name: 'to_address') required this.toAddress,
      @JsonKey(name: 'from_address') required this.fromAddress,
      required this.type,
      @JsonKey(name: "total_amount") required this.amount,
      @JsonKey(name: "total_fee") required this.fee,
      @JsonKey(name: 'date_crafted') required this.date,
      required this.height})
      : super._();

  factory _$_WebTransaction.fromJson(Map<String, dynamic> json) => _$$_WebTransactionFromJson(json);

  @override
  final String hash;
  @override
  @JsonKey(name: 'to_address')
  final String toAddress;
  @override
  @JsonKey(name: 'from_address')
  final String fromAddress;
  @override
  final int type;
  @override
  @JsonKey(name: "total_amount")
  final double? amount;
  @override
  @JsonKey(name: "total_fee")
  final double? fee;
  @override
  @JsonKey(name: 'date_crafted')
  final DateTime date;
// required int nonce,
// required int timestamp,
// @JsonKey(name: 'nft_data') dynamic nftData,
// required String signature,
  @override
  final int height;

  @override
  String toString() {
    return 'WebTransaction(hash: $hash, toAddress: $toAddress, fromAddress: $fromAddress, type: $type, amount: $amount, fee: $fee, date: $date, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTransaction &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.toAddress, toAddress) &&
            const DeepCollectionEquality().equals(other.fromAddress, fromAddress) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(toAddress),
      const DeepCollectionEquality().hash(fromAddress),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  _$$_WebTransactionCopyWith<_$_WebTransaction> get copyWith => __$$_WebTransactionCopyWithImpl<_$_WebTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTransactionToJson(this);
  }
}

abstract class _WebTransaction extends WebTransaction {
  factory _WebTransaction(
      {required final String hash,
      @JsonKey(name: 'to_address') required final String toAddress,
      @JsonKey(name: 'from_address') required final String fromAddress,
      required final int type,
      @JsonKey(name: "total_amount") required final double? amount,
      @JsonKey(name: "total_fee") required final double? fee,
      @JsonKey(name: 'date_crafted') required final DateTime date,
      required final int height}) = _$_WebTransaction;
  _WebTransaction._() : super._();

  factory _WebTransaction.fromJson(Map<String, dynamic> json) = _$_WebTransaction.fromJson;

  @override
  String get hash => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'to_address')
  String get toAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'from_address')
  String get fromAddress => throw _privateConstructorUsedError;
  @override
  int get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "total_amount")
  double? get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "total_fee")
  double? get fee => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date_crafted')
  DateTime get date => throw _privateConstructorUsedError;
  @override // required int nonce,
// required int timestamp,
// @JsonKey(name: 'nft_data') dynamic nftData,
// required String signature,
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WebTransactionCopyWith<_$_WebTransaction> get copyWith => throw _privateConstructorUsedError;
}

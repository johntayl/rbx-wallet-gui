// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bulk_smart_contract_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BulkSmartContractEntry {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  Royalty? get royalty => throw _privateConstructorUsedError;
  List<Asset> get additionalAssets => throw _privateConstructorUsedError;
  Evolve get evolve => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BulkSmartContractEntryCopyWith<BulkSmartContractEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkSmartContractEntryCopyWith<$Res> {
  factory $BulkSmartContractEntryCopyWith(BulkSmartContractEntry value,
          $Res Function(BulkSmartContractEntry) then) =
      _$BulkSmartContractEntryCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      String creatorName,
      Asset? primaryAsset,
      int quantity,
      Royalty? royalty,
      List<Asset> additionalAssets,
      Evolve evolve});

  $AssetCopyWith<$Res>? get primaryAsset;
  $RoyaltyCopyWith<$Res>? get royalty;
  $EvolveCopyWith<$Res> get evolve;
}

/// @nodoc
class _$BulkSmartContractEntryCopyWithImpl<$Res>
    implements $BulkSmartContractEntryCopyWith<$Res> {
  _$BulkSmartContractEntryCopyWithImpl(this._value, this._then);

  final BulkSmartContractEntry _value;
  // ignore: unused_field
  final $Res Function(BulkSmartContractEntry) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? creatorName = freezed,
    Object? primaryAsset = freezed,
    Object? quantity = freezed,
    Object? royalty = freezed,
    Object? additionalAssets = freezed,
    Object? evolve = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      royalty: royalty == freezed
          ? _value.royalty
          : royalty // ignore: cast_nullable_to_non_nullable
              as Royalty?,
      additionalAssets: additionalAssets == freezed
          ? _value.additionalAssets
          : additionalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      evolve: evolve == freezed
          ? _value.evolve
          : evolve // ignore: cast_nullable_to_non_nullable
              as Evolve,
    ));
  }

  @override
  $AssetCopyWith<$Res>? get primaryAsset {
    if (_value.primaryAsset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.primaryAsset!, (value) {
      return _then(_value.copyWith(primaryAsset: value));
    });
  }

  @override
  $RoyaltyCopyWith<$Res>? get royalty {
    if (_value.royalty == null) {
      return null;
    }

    return $RoyaltyCopyWith<$Res>(_value.royalty!, (value) {
      return _then(_value.copyWith(royalty: value));
    });
  }

  @override
  $EvolveCopyWith<$Res> get evolve {
    return $EvolveCopyWith<$Res>(_value.evolve, (value) {
      return _then(_value.copyWith(evolve: value));
    });
  }
}

/// @nodoc
abstract class _$$_BulkSmartContractEntryCopyWith<$Res>
    implements $BulkSmartContractEntryCopyWith<$Res> {
  factory _$$_BulkSmartContractEntryCopyWith(_$_BulkSmartContractEntry value,
          $Res Function(_$_BulkSmartContractEntry) then) =
      __$$_BulkSmartContractEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      String creatorName,
      Asset? primaryAsset,
      int quantity,
      Royalty? royalty,
      List<Asset> additionalAssets,
      Evolve evolve});

  @override
  $AssetCopyWith<$Res>? get primaryAsset;
  @override
  $RoyaltyCopyWith<$Res>? get royalty;
  @override
  $EvolveCopyWith<$Res> get evolve;
}

/// @nodoc
class __$$_BulkSmartContractEntryCopyWithImpl<$Res>
    extends _$BulkSmartContractEntryCopyWithImpl<$Res>
    implements _$$_BulkSmartContractEntryCopyWith<$Res> {
  __$$_BulkSmartContractEntryCopyWithImpl(_$_BulkSmartContractEntry _value,
      $Res Function(_$_BulkSmartContractEntry) _then)
      : super(_value, (v) => _then(v as _$_BulkSmartContractEntry));

  @override
  _$_BulkSmartContractEntry get _value =>
      super._value as _$_BulkSmartContractEntry;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? creatorName = freezed,
    Object? primaryAsset = freezed,
    Object? quantity = freezed,
    Object? royalty = freezed,
    Object? additionalAssets = freezed,
    Object? evolve = freezed,
  }) {
    return _then(_$_BulkSmartContractEntry(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      royalty: royalty == freezed
          ? _value.royalty
          : royalty // ignore: cast_nullable_to_non_nullable
              as Royalty?,
      additionalAssets: additionalAssets == freezed
          ? _value._additionalAssets
          : additionalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      evolve: evolve == freezed
          ? _value.evolve
          : evolve // ignore: cast_nullable_to_non_nullable
              as Evolve,
    ));
  }
}

/// @nodoc

class _$_BulkSmartContractEntry extends _BulkSmartContractEntry {
  _$_BulkSmartContractEntry(
      {required this.name,
      required this.description,
      required this.creatorName,
      this.primaryAsset,
      this.quantity = 1,
      this.royalty,
      final List<Asset> additionalAssets = const [],
      this.evolve = const Evolve()})
      : _additionalAssets = additionalAssets,
        super._();

  @override
  final String name;
  @override
  final String description;
  @override
  final String creatorName;
  @override
  final Asset? primaryAsset;
  @override
  @JsonKey()
  final int quantity;
  @override
  final Royalty? royalty;
  final List<Asset> _additionalAssets;
  @override
  @JsonKey()
  List<Asset> get additionalAssets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalAssets);
  }

  @override
  @JsonKey()
  final Evolve evolve;

  @override
  String toString() {
    return 'BulkSmartContractEntry(name: $name, description: $description, creatorName: $creatorName, primaryAsset: $primaryAsset, quantity: $quantity, royalty: $royalty, additionalAssets: $additionalAssets, evolve: $evolve)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BulkSmartContractEntry &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.creatorName, creatorName) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.royalty, royalty) &&
            const DeepCollectionEquality()
                .equals(other._additionalAssets, _additionalAssets) &&
            const DeepCollectionEquality().equals(other.evolve, evolve));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(creatorName),
      const DeepCollectionEquality().hash(primaryAsset),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(royalty),
      const DeepCollectionEquality().hash(_additionalAssets),
      const DeepCollectionEquality().hash(evolve));

  @JsonKey(ignore: true)
  @override
  _$$_BulkSmartContractEntryCopyWith<_$_BulkSmartContractEntry> get copyWith =>
      __$$_BulkSmartContractEntryCopyWithImpl<_$_BulkSmartContractEntry>(
          this, _$identity);
}

abstract class _BulkSmartContractEntry extends BulkSmartContractEntry {
  factory _BulkSmartContractEntry(
      {required final String name,
      required final String description,
      required final String creatorName,
      final Asset? primaryAsset,
      final int quantity,
      final Royalty? royalty,
      final List<Asset> additionalAssets,
      final Evolve evolve}) = _$_BulkSmartContractEntry;
  _BulkSmartContractEntry._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get creatorName => throw _privateConstructorUsedError;
  @override
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  Royalty? get royalty => throw _privateConstructorUsedError;
  @override
  List<Asset> get additionalAssets => throw _privateConstructorUsedError;
  @override
  Evolve get evolve => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BulkSmartContractEntryCopyWith<_$_BulkSmartContractEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

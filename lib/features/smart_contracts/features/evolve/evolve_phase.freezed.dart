// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'evolve_phase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EvolvePhase _$EvolvePhaseFromJson(Map<String, dynamic> json) {
  return _EvolvePhase.fromJson(json);
}

/// @nodoc
class _$EvolvePhaseTearOff {
  const _$EvolvePhaseTearOff();

  _EvolvePhase call(
      {String name = "",
      DateTime? dateTime,
      int? blockHeight,
      String description = "",
      int evolutionState = 0,
      bool isCurrentState = false,
      Asset? asset}) {
    return _EvolvePhase(
      name: name,
      dateTime: dateTime,
      blockHeight: blockHeight,
      description: description,
      evolutionState: evolutionState,
      isCurrentState: isCurrentState,
      asset: asset,
    );
  }

  EvolvePhase fromJson(Map<String, Object?> json) {
    return EvolvePhase.fromJson(json);
  }
}

/// @nodoc
const $EvolvePhase = _$EvolvePhaseTearOff();

/// @nodoc
mixin _$EvolvePhase {
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  int? get blockHeight =>
      throw _privateConstructorUsedError; // @Default("") String expectedValue,
  String get description => throw _privateConstructorUsedError;
  int get evolutionState => throw _privateConstructorUsedError;
  bool get isCurrentState => throw _privateConstructorUsedError;
  Asset? get asset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvolvePhaseCopyWith<EvolvePhase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolvePhaseCopyWith<$Res> {
  factory $EvolvePhaseCopyWith(
          EvolvePhase value, $Res Function(EvolvePhase) then) =
      _$EvolvePhaseCopyWithImpl<$Res>;
  $Res call(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset});

  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class _$EvolvePhaseCopyWithImpl<$Res> implements $EvolvePhaseCopyWith<$Res> {
  _$EvolvePhaseCopyWithImpl(this._value, this._then);

  final EvolvePhase _value;
  // ignore: unused_field
  final $Res Function(EvolvePhase) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? dateTime = freezed,
    Object? blockHeight = freezed,
    Object? description = freezed,
    Object? evolutionState = freezed,
    Object? isCurrentState = freezed,
    Object? asset = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evolutionState: evolutionState == freezed
          ? _value.evolutionState
          : evolutionState // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrentState: isCurrentState == freezed
          ? _value.isCurrentState
          : isCurrentState // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }

  @override
  $AssetCopyWith<$Res>? get asset {
    if (_value.asset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.asset!, (value) {
      return _then(_value.copyWith(asset: value));
    });
  }
}

/// @nodoc
abstract class _$EvolvePhaseCopyWith<$Res>
    implements $EvolvePhaseCopyWith<$Res> {
  factory _$EvolvePhaseCopyWith(
          _EvolvePhase value, $Res Function(_EvolvePhase) then) =
      __$EvolvePhaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset});

  @override
  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class __$EvolvePhaseCopyWithImpl<$Res> extends _$EvolvePhaseCopyWithImpl<$Res>
    implements _$EvolvePhaseCopyWith<$Res> {
  __$EvolvePhaseCopyWithImpl(
      _EvolvePhase _value, $Res Function(_EvolvePhase) _then)
      : super(_value, (v) => _then(v as _EvolvePhase));

  @override
  _EvolvePhase get _value => super._value as _EvolvePhase;

  @override
  $Res call({
    Object? name = freezed,
    Object? dateTime = freezed,
    Object? blockHeight = freezed,
    Object? description = freezed,
    Object? evolutionState = freezed,
    Object? isCurrentState = freezed,
    Object? asset = freezed,
  }) {
    return _then(_EvolvePhase(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evolutionState: evolutionState == freezed
          ? _value.evolutionState
          : evolutionState // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrentState: isCurrentState == freezed
          ? _value.isCurrentState
          : isCurrentState // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_EvolvePhase extends _EvolvePhase {
  const _$_EvolvePhase(
      {this.name = "",
      this.dateTime,
      this.blockHeight,
      this.description = "",
      this.evolutionState = 0,
      this.isCurrentState = false,
      this.asset})
      : super._();

  factory _$_EvolvePhase.fromJson(Map<String, dynamic> json) =>
      _$$_EvolvePhaseFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String name;
  @override
  final DateTime? dateTime;
  @override
  final int? blockHeight;
  @JsonKey(defaultValue: "")
  @override // @Default("") String expectedValue,
  final String description;
  @JsonKey(defaultValue: 0)
  @override
  final int evolutionState;
  @JsonKey(defaultValue: false)
  @override
  final bool isCurrentState;
  @override
  final Asset? asset;

  @override
  String toString() {
    return 'EvolvePhase(name: $name, dateTime: $dateTime, blockHeight: $blockHeight, description: $description, evolutionState: $evolutionState, isCurrentState: $isCurrentState, asset: $asset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EvolvePhase &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.blockHeight, blockHeight) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.evolutionState, evolutionState) &&
            const DeepCollectionEquality()
                .equals(other.isCurrentState, isCurrentState) &&
            const DeepCollectionEquality().equals(other.asset, asset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(blockHeight),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(evolutionState),
      const DeepCollectionEquality().hash(isCurrentState),
      const DeepCollectionEquality().hash(asset));

  @JsonKey(ignore: true)
  @override
  _$EvolvePhaseCopyWith<_EvolvePhase> get copyWith =>
      __$EvolvePhaseCopyWithImpl<_EvolvePhase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvolvePhaseToJson(this);
  }
}

abstract class _EvolvePhase extends EvolvePhase {
  const factory _EvolvePhase(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset}) = _$_EvolvePhase;
  const _EvolvePhase._() : super._();

  factory _EvolvePhase.fromJson(Map<String, dynamic> json) =
      _$_EvolvePhase.fromJson;

  @override
  String get name;
  @override
  DateTime? get dateTime;
  @override
  int? get blockHeight;
  @override // @Default("") String expectedValue,
  String get description;
  @override
  int get evolutionState;
  @override
  bool get isCurrentState;
  @override
  Asset? get asset;
  @override
  @JsonKey(ignore: true)
  _$EvolvePhaseCopyWith<_EvolvePhase> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NodeInfo _$NodeInfoFromJson(Map<String, dynamic> json) {
  return _NodeInfo.fromJson(json);
}

/// @nodoc
mixin _$NodeInfo {
  @JsonKey(name: 'NodeIP')
  String get ip => throw _privateConstructorUsedError;
  @JsonKey(name: 'NodeHeight')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'NodeLatency')
  int get latency => throw _privateConstructorUsedError;
  @JsonKey(name: 'NodeLastChecked')
  DateTime? get lastCheked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeInfoCopyWith<NodeInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeInfoCopyWith<$Res> {
  factory $NodeInfoCopyWith(NodeInfo value, $Res Function(NodeInfo) then) = _$NodeInfoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'NodeIP') String ip,
      @JsonKey(name: 'NodeHeight') int height,
      @JsonKey(name: 'NodeLatency') int latency,
      @JsonKey(name: 'NodeLastChecked') DateTime? lastCheked});
}

/// @nodoc
class _$NodeInfoCopyWithImpl<$Res> implements $NodeInfoCopyWith<$Res> {
  _$NodeInfoCopyWithImpl(this._value, this._then);

  final NodeInfo _value;
  // ignore: unused_field
  final $Res Function(NodeInfo) _then;

  @override
  $Res call({
    Object? ip = freezed,
    Object? height = freezed,
    Object? latency = freezed,
    Object? lastCheked = freezed,
  }) {
    return _then(_value.copyWith(
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      latency: latency == freezed
          ? _value.latency
          : latency // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheked: lastCheked == freezed
          ? _value.lastCheked
          : lastCheked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_NodeInfoCopyWith<$Res> implements $NodeInfoCopyWith<$Res> {
  factory _$$_NodeInfoCopyWith(_$_NodeInfo value, $Res Function(_$_NodeInfo) then) = __$$_NodeInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'NodeIP') String ip,
      @JsonKey(name: 'NodeHeight') int height,
      @JsonKey(name: 'NodeLatency') int latency,
      @JsonKey(name: 'NodeLastChecked') DateTime? lastCheked});
}

/// @nodoc
class __$$_NodeInfoCopyWithImpl<$Res> extends _$NodeInfoCopyWithImpl<$Res> implements _$$_NodeInfoCopyWith<$Res> {
  __$$_NodeInfoCopyWithImpl(_$_NodeInfo _value, $Res Function(_$_NodeInfo) _then) : super(_value, (v) => _then(v as _$_NodeInfo));

  @override
  _$_NodeInfo get _value => super._value as _$_NodeInfo;

  @override
  $Res call({
    Object? ip = freezed,
    Object? height = freezed,
    Object? latency = freezed,
    Object? lastCheked = freezed,
  }) {
    return _then(_$_NodeInfo(
      ip: ip == freezed
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      latency: latency == freezed
          ? _value.latency
          : latency // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheked: lastCheked == freezed
          ? _value.lastCheked
          : lastCheked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NodeInfo extends _NodeInfo {
  _$_NodeInfo(
      {@JsonKey(name: 'NodeIP') required this.ip,
      @JsonKey(name: 'NodeHeight') required this.height,
      @JsonKey(name: 'NodeLatency') required this.latency,
      @JsonKey(name: 'NodeLastChecked') this.lastCheked})
      : super._();

  factory _$_NodeInfo.fromJson(Map<String, dynamic> json) => _$$_NodeInfoFromJson(json);

  @override
  @JsonKey(name: 'NodeIP')
  final String ip;
  @override
  @JsonKey(name: 'NodeHeight')
  final int height;
  @override
  @JsonKey(name: 'NodeLatency')
  final int latency;
  @override
  @JsonKey(name: 'NodeLastChecked')
  final DateTime? lastCheked;

  @override
  String toString() {
    return 'NodeInfo(ip: $ip, height: $height, latency: $latency, lastCheked: $lastCheked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NodeInfo &&
            const DeepCollectionEquality().equals(other.ip, ip) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.latency, latency) &&
            const DeepCollectionEquality().equals(other.lastCheked, lastCheked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(ip), const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(latency), const DeepCollectionEquality().hash(lastCheked));

  @JsonKey(ignore: true)
  @override
  _$$_NodeInfoCopyWith<_$_NodeInfo> get copyWith => __$$_NodeInfoCopyWithImpl<_$_NodeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NodeInfoToJson(this);
  }
}

abstract class _NodeInfo extends NodeInfo {
  factory _NodeInfo(
      {@JsonKey(name: 'NodeIP') required final String ip,
      @JsonKey(name: 'NodeHeight') required final int height,
      @JsonKey(name: 'NodeLatency') required final int latency,
      @JsonKey(name: 'NodeLastChecked') final DateTime? lastCheked}) = _$_NodeInfo;
  _NodeInfo._() : super._();

  factory _NodeInfo.fromJson(Map<String, dynamic> json) = _$_NodeInfo.fromJson;

  @override
  @JsonKey(name: 'NodeIP')
  String get ip => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'NodeHeight')
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'NodeLatency')
  int get latency => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'NodeLastChecked')
  DateTime? get lastCheked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NodeInfoCopyWith<_$_NodeInfo> get copyWith => throw _privateConstructorUsedError;
}

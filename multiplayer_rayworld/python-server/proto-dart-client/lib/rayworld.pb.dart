///
//  Generated code. Do not modify.
//  source: rayworld.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class PlayerState_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayerState.Position', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'rayworld_protocol'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction', $pb.PbFieldType.O3)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  PlayerState_Position._() : super();
  factory PlayerState_Position({
    $core.int? direction,
    $core.double? x,
    $core.double? y,
  }) {
    final _result = create();
    if (direction != null) {
      _result.direction = direction;
    }
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory PlayerState_Position.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerState_Position.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerState_Position clone() => PlayerState_Position()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerState_Position copyWith(void Function(PlayerState_Position) updates) => super.copyWith((message) => updates(message as PlayerState_Position)) as PlayerState_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerState_Position create() => PlayerState_Position._();
  PlayerState_Position createEmptyInstance() => create();
  static $pb.PbList<PlayerState_Position> createRepeated() => $pb.PbList<PlayerState_Position>();
  @$core.pragma('dart2js:noInline')
  static PlayerState_Position getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerState_Position>(create);
  static PlayerState_Position? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get direction => $_getIZ(0);
  @$pb.TagNumber(1)
  set direction($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearDirection() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get x => $_getN(1);
  @$pb.TagNumber(2)
  set x($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasX() => $_has(1);
  @$pb.TagNumber(2)
  void clearX() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get y => $_getN(2);
  @$pb.TagNumber(3)
  set y($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasY() => $_has(2);
  @$pb.TagNumber(3)
  void clearY() => clearField(3);
}

class PlayerState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayerState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'rayworld_protocol'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tick')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<PlayerState_Position>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pos', subBuilder: PlayerState_Position.create)
    ..hasRequiredFields = false
  ;

  PlayerState._() : super();
  factory PlayerState({
    $fixnum.Int64? tick,
    $core.String? name,
    $core.int? id,
    PlayerState_Position? pos,
  }) {
    final _result = create();
    if (tick != null) {
      _result.tick = tick;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (pos != null) {
      _result.pos = pos;
    }
    return _result;
  }
  factory PlayerState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerState clone() => PlayerState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerState copyWith(void Function(PlayerState) updates) => super.copyWith((message) => updates(message as PlayerState)) as PlayerState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerState create() => PlayerState._();
  PlayerState createEmptyInstance() => create();
  static $pb.PbList<PlayerState> createRepeated() => $pb.PbList<PlayerState>();
  @$core.pragma('dart2js:noInline')
  static PlayerState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerState>(create);
  static PlayerState? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get tick => $_getI64(0);
  @$pb.TagNumber(1)
  set tick($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTick() => $_has(0);
  @$pb.TagNumber(1)
  void clearTick() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get id => $_getIZ(2);
  @$pb.TagNumber(3)
  set id($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  PlayerState_Position get pos => $_getN(3);
  @$pb.TagNumber(4)
  set pos(PlayerState_Position v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPos() => $_has(3);
  @$pb.TagNumber(4)
  void clearPos() => clearField(4);
  @$pb.TagNumber(4)
  PlayerState_Position ensurePos() => $_ensure(3);
}

class WorldState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WorldState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'rayworld_protocol'), createEmptyInstance: create)
    ..pc<PlayerState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players', $pb.PbFieldType.PM, subBuilder: PlayerState.create)
    ..hasRequiredFields = false
  ;

  WorldState._() : super();
  factory WorldState({
    $core.Iterable<PlayerState>? players,
  }) {
    final _result = create();
    if (players != null) {
      _result.players.addAll(players);
    }
    return _result;
  }
  factory WorldState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WorldState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WorldState clone() => WorldState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WorldState copyWith(void Function(WorldState) updates) => super.copyWith((message) => updates(message as WorldState)) as WorldState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WorldState create() => WorldState._();
  WorldState createEmptyInstance() => create();
  static $pb.PbList<WorldState> createRepeated() => $pb.PbList<WorldState>();
  @$core.pragma('dart2js:noInline')
  static WorldState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WorldState>(create);
  static WorldState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PlayerState> get players => $_getList(0);
}


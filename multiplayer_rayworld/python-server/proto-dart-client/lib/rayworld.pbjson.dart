///
//  Generated code. Do not modify.
//  source: rayworld.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use playerStateDescriptor instead')
const PlayerState$json = const {
  '1': 'PlayerState',
  '2': const [
    const {'1': 'tick', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'tick', '17': true},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'name', '17': true},
    const {'1': 'id', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'id', '17': true},
    const {'1': 'pos', '3': 4, '4': 1, '5': 11, '6': '.rayworld_protocol.PlayerState.Position', '10': 'pos'},
  ],
  '3': const [PlayerState_Position$json],
  '8': const [
    const {'1': '_tick'},
    const {'1': '_name'},
    const {'1': '_id'},
  ],
};

@$core.Deprecated('Use playerStateDescriptor instead')
const PlayerState_Position$json = const {
  '1': 'Position',
  '2': const [
    const {'1': 'direction', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'direction', '17': true},
    const {'1': 'x', '3': 2, '4': 1, '5': 2, '9': 1, '10': 'x', '17': true},
    const {'1': 'y', '3': 3, '4': 1, '5': 2, '9': 2, '10': 'y', '17': true},
  ],
  '8': const [
    const {'1': '_direction'},
    const {'1': '_x'},
    const {'1': '_y'},
  ],
};

/// Descriptor for `PlayerState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerStateDescriptor = $convert.base64Decode('CgtQbGF5ZXJTdGF0ZRIXCgR0aWNrGAEgASgDSABSBHRpY2uIAQESFwoEbmFtZRgCIAEoCUgBUgRuYW1liAEBEhMKAmlkGAMgASgFSAJSAmlkiAEBEjkKA3BvcxgEIAEoCzInLnJheXdvcmxkX3Byb3RvY29sLlBsYXllclN0YXRlLlBvc2l0aW9uUgNwb3MabQoIUG9zaXRpb24SIQoJZGlyZWN0aW9uGAEgASgFSABSCWRpcmVjdGlvbogBARIRCgF4GAIgASgCSAFSAXiIAQESEQoBeRgDIAEoAkgCUgF5iAEBQgwKCl9kaXJlY3Rpb25CBAoCX3hCBAoCX3lCBwoFX3RpY2tCBwoFX25hbWVCBQoDX2lk');
@$core.Deprecated('Use worldStateDescriptor instead')
const WorldState$json = const {
  '1': 'WorldState',
  '2': const [
    const {'1': 'players', '3': 1, '4': 3, '5': 11, '6': '.rayworld_protocol.PlayerState', '10': 'players'},
  ],
};

/// Descriptor for `WorldState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List worldStateDescriptor = $convert.base64Decode('CgpXb3JsZFN0YXRlEjgKB3BsYXllcnMYASADKAsyHi5yYXl3b3JsZF9wcm90b2NvbC5QbGF5ZXJTdGF0ZVIHcGxheWVycw==');

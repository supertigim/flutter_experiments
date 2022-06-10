import 'dart:io';
import 'dart:typed_data';
import 'package:protobuf/protobuf.dart';

import 'package:proto_dart_client/rayworld.pb.dart';
import 'dart:math';

String curMilliSeconds() =>
    DateTime.fromMicrosecondsSinceEpoch(1640901600000000)
        .millisecondsSinceEpoch
        .toString();

Future<void> sendMessageBuffer(Socket socket, Uint8List message) async {
  print('Client: $message / length:${message.length}');
  socket.add(message);
  await Future.delayed(const Duration(seconds: 2));
}

void testProtoData2Send2Server(Socket socket) async {
  final worldState = WorldState();

  // First player
  var p1 = PlayerState();
  p1.tick = parseLongInt(curMilliSeconds());
  p1.name = "Terry";
  p1.id = Random().nextInt(10000);
  worldState.players.add(p1);

  // Second player
  var p2 = PlayerState();
  p2.tick = parseLongInt(curMilliSeconds());
  p2.name = "John";
  p2.id = Random().nextInt(10000);
  worldState.players.add(p1);
  print("Client:\n$worldState");

  await sendMessageBuffer(socket, worldState.writeToBuffer());
}

void checkReceivedData(Uint8List data) {
  var worldState = WorldState.fromBuffer(data);
  print('Server: \n$worldState');
}

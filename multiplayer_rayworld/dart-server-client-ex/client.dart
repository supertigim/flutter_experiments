import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

void main() async {
  // connect to the socket server
  final socket = await Socket.connect('127.0.0.1', 5555);
  if (kDebugMode) {
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
  }

  // listen for responses from the server
  socket.listen(
    // handle data from the server
    (Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      if (kDebugMode) {
        print('Server: $serverResponse');
      }
    },

    // handle errors
    onError: (error) {
      if (kDebugMode) {
        print(error);
      }
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      if (kDebugMode) {
        print('Server left.');
      }
      socket.destroy();
    },
  );

  // send some messages to the server
  await sendMessage(socket, 'Knock, knock.');
  await sendMessage(socket, 'Banana');
  await sendMessage(socket, 'Banana');
  await sendMessage(socket, 'Banana');
  await sendMessage(socket, 'Banana');
  await sendMessage(socket, 'Banana');
  await sendMessage(socket, 'Orange');
  await sendMessage(socket, "Orange you glad I didn't say banana again?");
}

Future<void> sendMessage(Socket socket, String message) async {
  if (kDebugMode) {
    print('Client: $message');
  }
  socket.write(message);
  await Future.delayed(const Duration(seconds: 2));
}

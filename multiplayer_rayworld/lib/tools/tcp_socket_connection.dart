import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class TcpSocketConnection {
  final String _ipAddress;
  final int _portAddress;

  late final Socket _server;
  bool _connected = false;

  TcpSocketConnection(this._ipAddress, this._portAddress);

  connect(Function callback) async {
    try {
      _server = await Socket.connect(_ipAddress, _portAddress);
    } on Exception {
      if (kDebugMode) {
        print('something wrong when trying to connect');
      }
      return;
    }

    _connected = true;
    if (kDebugMode) {
      print("Socket successfully connected");
    }

    // listen for responses from the server
    _server.listen(
      // handle data from the server
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        if (kDebugMode) {
          print('Server: $serverResponse');
        }
        callback(serverResponse);
      },

      // handle errors
      onError: (error) {
        if (kDebugMode) {
          print(error);
        }
        _server.destroy();
      },

      // handle server ending connection
      onDone: () {
        if (kDebugMode) {
          print('Server left.');
        }
        _server.destroy();
      },
    );
  }

  /// Stop the connection and close the socket
  void disconnect() {
    try {
      _server.close();
      if (kDebugMode) {
        print("Socket disconnected successfully");
      }
    } on Exception {
      if (kDebugMode) {
        print("ERROR");
      }
    }
    _connected = false;
  }

  /// Check if the socket is connected
  bool isConnected() {
    return _connected;
  }

  /// Send message to server. Make sure to have established a connection before calling this method
  void sendMessage(String message) async {
    _server.add(utf8.encode(message));
    if (kDebugMode) {
      print("Message sent: " + message);
    }
  }
}

import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';

main() async {
  Socket socket = await Socket.connect('127.0.0.1', 5555);
  if (kDebugMode) {
    print('connected');
  }

  // listen to the received data event stream
  socket.listen((List<int> event) {
    if (kDebugMode) {
      print(utf8.decode(event));
    }
  });

  // send hello
  socket.add(utf8.encode('hello'));

  // wait 5 seconds
  await Future.delayed(const Duration(seconds: 5));

  // .. and close the socket
  socket.close();
}

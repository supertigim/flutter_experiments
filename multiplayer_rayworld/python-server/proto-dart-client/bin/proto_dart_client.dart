import 'package:proto_dart_client/proto_dart_client.dart' as proto_dart_client;
import 'dart:io';
import 'dart:typed_data';

void main() async {
  // connect to the socket server
  final socket = await Socket.connect('127.0.0.1', 5556);
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

  // listen for responses from the server
  socket.listen(
    // handle data from the server
    (Uint8List data) {
      print('Data from Server: $data\nSize: ${data.length}');
      proto_dart_client.checkReceivedData(data);
    },

    // handle errors
    onError: (error) {
      print(error);
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      print('Server left.');
      socket.destroy();
    },
  );

  proto_dart_client.testProtoData2Send2Server(socket);
}

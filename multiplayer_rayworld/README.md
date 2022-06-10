# Multiplyer RayWorld

A new Flutter-Flame Game project inherited from [rayworld](https://www.raywenderlich.com/27407121-building-games-in-flutter-with-flame-getting-started). This project shows how to make a mulitplayer game in Flutter for clients and Python for the server. Please make sure that this is only for study not for production and I have found a tons of bugs inside. For example, each client may show different position of players although movement is somehow synchronous.  

Please make sure that the following instruction is ONLY available on MacOS.

## Getting Started

1.start python server first.

```bash
    # to use protobuf
    % pip install protobuf 

    # go to python-server directory
    # Change configs in your taste. 
    % python server.py
```

2.Launch your app in an emulator  

For Android, you should change IP address to `"10.0.2.2"`.  

macOS emulator is supportive (but not Chrome).  

## How to update protocols

Google protobuf is applied to this project. In protocols folder, you can check the protocols used. 

```bash
    # only on MacOS
    % brew install protobuf 

    # for Dart, protoc_plugin is required 
    # https://github.com/google/protobuf.dart/tree/master/protoc_plugin
    % dart pub global activate protoc_plugin

    # go to protocols directory
    # update rayworld.proto
    % protoc -I=./ --python_out=./ ./rayworld.proto
    % protoc -I=./ --dart_out=../python-server/proto-dart-client/lib ./rayworld.proto
```

## Reference  

- [Flame examples](https://github.com/flame-engine/flame/tree/main/examples)  
- [Text Rendering](https://docs.flame-engine.org/1.0.0/text.html)  
- [Protocol Buffer Basics: Dart](https://developers.google.com/protocol-buffers/docs/darttutorial)  
- [How you turn a string into a number (or vice versa) with Dart](https://dev.to/wangonya/how-you-turn-a-string-into-a-number-or-vice-versa-with-dart-392h)  
- [userevent - python stopwatch milliseconds](https://code-examples.net/en/q/112d90f)  
- [Python으로 게임만들기(Pygame) – 화면 프레임수 설정](https://blog.dalso.org/language/python/14181)  
- [Enum from String](https://stackoverflow.com/questions/27673781/enum-from-string)  
- [Working with Sockets in Dart](https://medium.com/flutter-community/working-with-sockets-in-dart-15b443007bc9#:~:text=replace%20bin%2Fsocket_client.-,dart%20with%20the%20following%20code%3A,to%20convert%20it%20to%20one.)  
- [macOS emulator에서 tcp 연결 문제 해결 - com.apple.security.network.client 를 entitlement에 추가해야 함](https://docs.flutter.dev/desktop/macos)  
- [protobuf 맥북 설치]](http://daplus.net/protocol-buffers-mac%EC%97%90-google-%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C-%EB%B2%84%ED%8D%BC-%EC%84%A4%EC%B9%98/)
- [protobuf for Dart](https://developers.google.com/protocol-buffers/docs/darttutorial)  
- [EPOC time in miliseconds](https://www.geeksforgeeks.org/get-current-time-in-milliseconds-using-python/)  
- [protobuf for Dart](https://github.com/google/protobuf.dart/tree/master/protoc_plugin)
- [milliseconds since EPOCH in Dart](https://bacha.tistory.com/64) 
- [How to create a pure Dart project (not Flutter)](https://www.raywenderlich.com/books/dart-apprentice/v1.1/chapters/1-hello-dart)

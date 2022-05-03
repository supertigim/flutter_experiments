# Multiplyer RayWorld

A new Flutter-Flame Game project inherited from [rayworld](https://www.raywenderlich.com/27407121-building-games-in-flutter-with-flame-getting-started). This project shows how to make a mulitplayer game in Flutter for clients and Python for the server. Please make sure that this is only for study not for production and I have found a tons of bugs inside. For example, each client may show different position of players although movement is somehow synchronous.  

## Getting Started

1.start python server first.

```bash
    # go to python-server directory
    # Change confis in your taste. 
    % python server.py
```

2.Launch your app in an emulator  

For Android, you should change IP address to `"10.0.2.2"`.  

## Reference  

- [Flame examples](https://github.com/flame-engine/flame/tree/main/examples)  
- [Text Rendering](https://docs.flame-engine.org/1.0.0/text.html)  
- [Protocol Buffer Basics: Dart](https://developers.google.com/protocol-buffers/docs/darttutorial)  
- [How you turn a string into a number (or vice versa) with Dart](https://dev.to/wangonya/how-you-turn-a-string-into-a-number-or-vice-versa-with-dart-392h)  
- [userevent - python stopwatch milliseconds](https://code-examples.net/en/q/112d90f)  
- [Python으로 게임만들기(Pygame) – 화면 프레임수 설정](https://blog.dalso.org/language/python/14181)  
- [Enum from String](https://stackoverflow.com/questions/27673781/enum-from-string)  
- [Working with Sockets in Dart](https://medium.com/flutter-community/working-with-sockets-in-dart-15b443007bc9#:~:text=replace%20bin%2Fsocket_client.-,dart%20with%20the%20following%20code%3A,to%20convert%20it%20to%20one.)  

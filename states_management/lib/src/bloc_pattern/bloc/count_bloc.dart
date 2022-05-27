// ignore_for_file: constant_identifier_names

import 'dart:async';

enum CountEvent { ADD_EVENT, SUBSTRACT_EVENT }

class CountEventBloc {
  final StreamController<CountEvent> _countEventSubject =
      StreamController<CountEvent>();

  Sink<CountEvent> get countEventSink => _countEventSubject.sink;

  dispose() {
    _countEventSubject.close();
  }
}

class CountBloc {
  CountEventBloc countEventBloc = CountEventBloc();
  int _count = 0;
  final StreamController<int> _countSubject = StreamController<int>.broadcast();
  Stream<int> get count => _countSubject.stream;

  CountBloc() {
    // to listen events
    countEventBloc._countEventSubject.stream.listen(_countEventListen);
  }

  _countEventListen(CountEvent event) {
    switch (event) {
      case CountEvent.ADD_EVENT:
        _count++;
        break;
      case CountEvent.SUBSTRACT_EVENT:
        _count--;
        break;
    }
    _countSubject.sink.add(_count);
  }

  void dispose() {
    _countSubject.close();
  }

  // in case without Enum and Event Listener
  add() {
    _count++;
    _countSubject.sink.add(_count);
  }

  subtract() {
    _count++;
    _countSubject.sink.add(_count);
  }
}

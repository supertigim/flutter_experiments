import 'package:flutter/material.dart';
import 'package:states_management/src/bloc_pattern/bloc/count_bloc.dart';
import 'package:states_management/src/bloc_pattern/components/another_wrapper.dart';
import 'package:states_management/src/bloc_pattern/components/count_view_bloc.dart';

CountBloc? countBloc;

class BlocDisplayWidget extends StatefulWidget {
  const BlocDisplayWidget({Key? key}) : super(key: key);

  @override
  State<BlocDisplayWidget> createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
  }

  @override
  void dispose() {
    super.dispose();
    countBloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bloc pattern'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: CountView(),
          ),
          Expanded(
            child: AnotherWrapper(),
          )
        ],
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(
            onPressed: () {
              countBloc?.add();
              //countBloc?.countEventBloc.countEventSink
              //    .add(CountEvent.ADD_EVENT);
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              //countBloc?.subtract();
              countBloc?.countEventBloc.countEventSink
                  .add(CountEvent.SUBSTRACT_EVENT);
            },
            icon: const Icon(Icons.remove)),
      ]),
    );
  }
}

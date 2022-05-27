import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../components/count_view_stateless.dart';

class PlusStatefulDisplayWidget extends StatefulWidget {
  const PlusStatefulDisplayWidget({Key? key}) : super(key: key);

  @override
  State<PlusStatefulDisplayWidget> createState() =>
      _PlusStatefulDisplayWidgetState();
}

class _PlusStatefulDisplayWidgetState extends State<PlusStatefulDisplayWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Stateful'),
      ),
      body: CountViewStateless(
        count: count,
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            icon: const Icon(Icons.remove)),
      ]),
    );
  }
}

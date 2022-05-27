import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class CountViewStateless extends StatelessWidget {
  final int count;
  const CountViewStateless({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('CountViewStateless::Build');
    }
    return Center(
      child: Text(
        count.toString(),
        style: const TextStyle(fontSize: 80),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_management/src/provider/controllers/count_controller_with_provider.dart';

class CountViewProvider extends StatelessWidget {
  const CountViewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CountControllerWithProvider>(
          builder: (context, snapshot, child) {
        return Text(
          "${snapshot.count}",
          style: const TextStyle(fontSize: 80),
        );
      }),
    );
  }
}

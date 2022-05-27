import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_management/src/provider/components/count_view_provider.dart';
import 'package:states_management/src/provider/controllers/count_controller_with_provider.dart';

class ProviderDisplayWidget extends StatelessWidget {
  const ProviderDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: const CountViewProvider(),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false)
                  .increase();
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false)
                  .decrease();
            },
            icon: const Icon(Icons.remove)),
      ]),
    );
  }
}

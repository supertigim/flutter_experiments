import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:states_management/src/getx/components/count_view_getx.dart';
import 'package:states_management/src/getx/controllers/count_controller_with_getx.dart';

class GetXDisplayWidget extends StatelessWidget {
  final CountControllerWithGetX _controller =
      Get.put(CountControllerWithGetX());

  GetXDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // to delete previous controller object
        // but not sure if this is a proper way to do so.
        Get.deleteAll();
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GetX'),
        ),
        body: const CountViewGetX(),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              onPressed: () {
                _controller.increase();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                _controller.decrease();
              },
              icon: const Icon(Icons.remove)),
        ]),
      ),
    );
  }
}

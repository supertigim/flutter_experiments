import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:states_management/src/getx/controllers/count_controller_with_getx.dart';

class CountViewGetX extends StatelessWidget {
  const CountViewGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<CountControllerWithGetX>(
        builder: (controller) {
          return Text(
            "${controller.count}",
            style: const TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}

import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  int _count = 0;
  int get count => _count;
  void increase() {
    _count++;
    update();
  }

  void decrease() {
    _count--;
    update();
  }
}

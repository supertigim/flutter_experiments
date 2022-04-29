import 'package:flutter/material.dart';

class Wall extends StatelessWidget {
  const Wall({this.innerColor, this.outterColor, this.child, Key? key})
      : super(key: key);

  final innerColor; // ignore: prefer_typing_uninitialized_variables
  final outterColor; // ignore: prefer_typing_uninitialized_variables
  final child; // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(4),
          color: outterColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              //padding: const EdgeInsets.all(4),
              color: innerColor,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}

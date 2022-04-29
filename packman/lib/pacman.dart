import 'package:flutter/material.dart';

class PacMan extends StatelessWidget {
  const PacMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset('asset/images/pacman.png'),
    );
  }
}

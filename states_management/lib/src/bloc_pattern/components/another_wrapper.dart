import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:states_management/src/bloc_pattern/components/clone_count_view_bloc.dart';

class AnotherWrapper extends StatelessWidget {
  const AnotherWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('AnotherWrapper::Build');
    }
    return Row(
      children: const [
        Text(
          'Data from Bloc: ',
          style: TextStyle(fontSize: 20),
        ),
        CloneCountView(),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:states_management/src/bloc_pattern/ui/bloc_display_widget.dart';

class CloneCountView extends StatelessWidget {
  const CloneCountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('CloneCountView::Build');
    }
    return Center(
      child: StreamBuilder(
        stream: countBloc?.count,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 40),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

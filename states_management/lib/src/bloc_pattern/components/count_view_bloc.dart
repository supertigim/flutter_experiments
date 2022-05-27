import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:states_management/src/bloc_pattern/ui/bloc_display_widget.dart';

class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('CountView::Build');
    }
    return Center(
      child: StreamBuilder(
        stream: countBloc?.count,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 80),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

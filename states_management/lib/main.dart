//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:states_management/src/bloc_pattern/ui/bloc_display_widget.dart';
import 'package:states_management/src/getx/ui/getx_display_widget.dart';
import 'package:states_management/src/provider/controllers/count_controller_with_provider.dart';
import 'package:states_management/src/provider/ui/provider_display_widget.dart';
import 'package:states_management/src/stateful/ui/stateful_display_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _gap() {
    return const SizedBox(
      height: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // to delete previous controller object
                  // but not sure if this is a proper way to do so.
                  //Get.deleteAll();
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return GetXDisplayWidget();
                  }));
                },
                child: const Text('GetX'),
              ),
            ),
            _gap(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChangeNotifierProvider(
                        create: (context) => CountControllerWithProvider(),
                        child: const ProviderDisplayWidget());
                  }));
                },
                child: const Text('Provider'),
              ),
            ),
            _gap(),
            Center(
              child: ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   primary: Colors.grey[400],
                // ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const BlocDisplayWidget();
                  }));
                },
                child: const Text('BloC Pattern (not Bloc Module)'),
              ),
            ),
            _gap(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const PlusStatefulDisplayWidget();
                  }));
                },
                child: const Text('Default Stateful'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

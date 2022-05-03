import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title, required this.initConn})
      : super(key: key);
  final String title;
  final Function initConn;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var rememberValue = false;

  String ip = "";
  int port = 0;
  String charName = "";

  TextEditingController ipaddressController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController charNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ipaddressController.text = "127.0.0.1";
    portController.text = "5556";
    charNameController.text = "";

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Wolcome to Simple World',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: ipaddressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the Server Address';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter IP Address',
                      prefixText: 'IP: ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: portController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter port number';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixText: 'Port: ',
                      hintText: 'Enter port number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: charNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your character name';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixText: 'Name: ',
                      hintText: 'Enter your character name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print('ip:' + ipaddressController.text);
                          print('port: ' + portController.text);
                          print('Character Name: ' + charNameController.text);
                        }
                        widget.initConn(
                          ipaddressController.text,
                          int.parse(portController.text),
                          charNameController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Connect',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

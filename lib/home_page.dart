import 'package:flutter/material.dart';

import 'drop_down_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('What do you want to count?'),
              const DropdownButtonExample(),
              Container(
                  width: 280,
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textController,
                    autocorrect: true,
                    decoration:
                    const InputDecoration(hintText: 'Enter Some Text Here'),
                    onChanged: _onChanged,
                  )),
              ElevatedButton(
                onPressed: () { },
                child: const Text('Count!'),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Length = $charLength",
                      style: const TextStyle(fontSize: 20))),
            ],
          ),
        ));
  }
}

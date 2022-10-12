import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar:
            AppBar(title: const Text('MADT-2')),
            body: const Center(child: TextFieldClass())));
  }
}

class TextFieldClass extends StatefulWidget {
  const TextFieldClass({Key? key}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldClass> {
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
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Length = $charLength",
                      style: const TextStyle(fontSize: 20))),
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
            ],
          ),
        ));
  }
}

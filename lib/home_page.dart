import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  int length = 0;

  String dropdownValue = 'symbols';
  var items = [
    'symbols',
    'words',
  ];

  _onChanged(String value) {
    setState(() {
      if (dropdownValue == items[1]) {
        final regExp = RegExp(r"w+(\'\w+)?");
        length = regExp.allMatches(value).length;
      }
      length = value.length;
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
          DropdownButton(
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textController,
                autocorrect: true,
                decoration:
                    const InputDecoration(hintText: 'Enter Some Text Here'),
              )),
          ElevatedButton(
            onPressed: () {
              _onChanged(textController.text);
            },
            child: const Text('Count!'),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Length = $length",
                  style: const TextStyle(fontSize: 20))),
        ],
      ),
    ));
  }
}

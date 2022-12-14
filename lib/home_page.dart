import 'package:flutter/material.dart';
import 'package:madt_lab2/counter.dart';
import 'package:madt_lab2/resource.dart';

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

  _onChanged(String userInput) {
    setState(() {
      length = count(userInput, dropdownValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(Resource.suggestionWhatToCount),
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
                decoration: const InputDecoration(
                    hintText: Resource.suggestionToFillInTheTextField),
              )),
          ElevatedButton(
            onPressed: () {
              _onChanged(textController.text);
            },
            child: const Text(Resource.countButtonLabel),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Resource.result + length.toString(),
                  style: const TextStyle(fontSize: 20))),
        ],
      ),
    ));
  }
}

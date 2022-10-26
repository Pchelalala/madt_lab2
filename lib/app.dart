import 'package:flutter/material.dart';
import 'package:madt_lab2/resource.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text(Resource.appBarLabel)),
            body: const Center(child: HomePage())));
  }
}

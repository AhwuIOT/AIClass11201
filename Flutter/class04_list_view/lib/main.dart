import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 2400,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                width: 160,
                height: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                height: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                height: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                height: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                height: 160,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
